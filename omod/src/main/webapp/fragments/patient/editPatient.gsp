<%
	ui.decorateWith("kenyaui", "panel", [ heading: (config.heading ?: "Edit Patient"), frameOnly: true ])
	
	ui.includeJavascript("kenyaemr", "controllers/addresshierarchy.js")

	def nameFields = [
			[
					[ object: command, property: "personName.givenName", label: "Patient's Name *" ]
			],
			
			[
					[ object: command, property: "fatherName", label: "Father's Name *" ]
			],
	]

	def ingoNameFields = [
		[
				[ object: command, property: "ingoTypeConcept", label:"", config: [ style: "list", answerTo: ingoConcept ] ],
			]	
	]


	def otherDemogFieldRows = [
			[
					[ object: command, property: "maritalStatus", label: "Marital status", config: [ style: "list", options: maritalStatusOptions ] ],
					[ object: command, property: "occupation", label: "Occupation", config: [ style: "list", answerTo: occupationConcept ] ],
					[ object: command, property: "education", label: "Education", config: [ style: "list", options: educationOptions ] ]
			],
			[
					[ object: command, property: "dead", label: "Deceased" ],
					[ object: command, property: "deathDate", label: "Date of death" ]
			]
	]

	def nextOfKinFieldRows = [
			[
					[ object: command, property: "nameOfNextOfKin", label: "Name" ],
					[ object: command, property: "nextOfKinAddress", label: "Physical Address" ],
					[ object: command, property: "nextOfKinContact", label: "Contact Number" ]
			]
	]
	
	def enrollmentStatus = [
			[
					[ object: command, property: "enrollmentName", label: "Status at enrollment", config: [ style: "list", answerTo: enrollmentList ] ],
			]
	] 

	def addressFieldRows = [
			[
					[ object: command, property: "telephoneContact", label: "Telephone contact" ]
			],
			[
					[ object: command, property: "personAddress.address1", label: "Postal Address", config: [ size: 60 ] ],
					[ object: command, property: "personAddress.country", label: "County", config: [ size: 60 ] ],
					[ object: command, property: "subChiefName", label: "Subchief name" ]
			],
			[
					[ object: command, property: "personAddress.address3", label: "School/Employer Address",config: [ size: 60 ] ],
					[ object: command, property: "personAddress.countyDistrict", label: "District" ],
					[ object: command, property: "personAddress.stateProvince", label: "Province", config: [ size: 60 ] ]
			],
			[		[ object: command, property: "personAddress.address6", label: "Location" ],
					[ object: command, property: "personAddress.address5", label: "Sub-location" ],
					[ object: command, property: "personAddress.address4", label: "Division", config: [ size: 60 ] ]
			],
			[
					[ object: command, property: "personAddress.cityVillage", label: "Village/Estate" ],
					[ object: command, property: "personAddress.address2", label: "Landmark" ],
					[ object: command, property: "personAddress.postalCode", label: "House/Plot Number" ]
			]
	]
%>

<form id="edit-patient-form" method="post" action="${ ui.actionLink("kenyaemr", "patient/editPatient", "savePatient") }">
	<% if (command.original) { %>
		<input type="hidden" name="personId" value="${ command.original.id }"/>
	<% } %>

	<div class="ke-panel-content">

		<div class="ke-form-globalerrors" style="display: none"></div>

		<div class="ke-form-instructions">
			<strong>*</strong> indicates a required field
		</div>

		<fieldset>
			<legend>ID Numbers</legend>

			<table>
				<% if (command.inHivProgram) { %>
					<tr>
						<td class="ke-field-label">Unique Patient Number</td>
						<td>${ ui.includeFragment("kenyaui", "widget/field", [ object: command, property: "uniquePatientNumber" ]) }</td>
						<td class="ke-field-instructions">(HIV program<% if (!command.uniquePatientNumber) { %>, if assigned<% } %>)</td>
					</tr>
				<% } %>
				<tr>
					<td class="ke-field-label">Pre ART Registration Number</td>
					<td>${ ui.includeFragment("kenyaui", "widget/field", [ object: command, property: "preArtRegistrationNumber" ]) }</td>
					<td class="ke-field-instructions"><% if (!command.preArtRegistrationNumber) { %>(if available)<% } %></td>
				</tr>
				<tr>
					<td class="ke-field-label">NAP ART Registration Number</td>
					<td>${ ui.includeFragment("kenyaui", "widget/field", [ object: command, property: "napArtRegistrationNumber" ]) }</td>
					<td class="ke-field-instructions"><% if (!command.napArtRegistrationNumber) { %>(if available)<% } %></td>
				</tr>
				<tr>
					<td class="ke-field-label">INGO ART Registration Number</td>
					<td>${ ui.includeFragment("kenyaui", "widget/field", [ object: command, property: "artRegistrationNumber" ]) }</td>
					<td class="ke-field-instructions"><% if (!command.artRegistrationNumber) { %>(if available)<% } %></td>
					
					<td class="ke-field-label"> INGO NAME </td>
					<td>	<% ingoNameFields.each { %>
							${ ui.includeFragment("kenyaui", "widget/rowOfFields", [ fields: it ]) }<% } 
						%> </td> 
				</tr>
				<tr>
					<td class="ke-field-label"><b>Patient ID*</b></td>
					<td><input name="systemPatientId" style="width: 260px" value=${ patientIdentifier} readonly autocomplete="off" ></td>
					
					
				</tr>
			</table>

		</fieldset>

		<fieldset>
			<legend>Demographics</legend>

			<% nameFields.each { %>
			${ ui.includeFragment("kenyaui", "widget/rowOfFields", [ fields: it ]) }
			<% } %>

			<table>
				<tr>
					<td valign="top">
						<label class="ke-field-label">Gender *</label>
						<span class="ke-field-content">
							<input type="radio" name="gender" value="F" id="gender-F" ${ command.gender == 'F' ? 'checked="checked"' : '' }/> Female
							<input type="radio" name="gender" value="M" id="gender-M" ${ command.gender == 'M' ? 'checked="checked"' : '' }/> Male
							<span id="gender-F-error" class="error" style="display: none"></span>
							<span id="gender-M-error" class="error" style="display: none"></span>
						</span>
					</td>
					<td valign="top"></td>
					<td valign="top">
						<label class="ke-field-label">Birthdate *</label>
						<span class="ke-field-content">
							${ ui.includeFragment("kenyaui", "widget/field", [ id: "patient-birthdate", object: command, property: "birthdate" ]) }

							<span id="patient-birthdate-estimated">
								<input type="radio" name="birthdateEstimated" value="true" ${ command.birthdateEstimated ? 'checked="checked"' : '' }/> Estimated
								<input type="radio" name="birthdateEstimated" value="false" ${ !command.birthdateEstimated ? 'checked="checked"' : '' }/> Exact
							</span>
							&nbsp;&nbsp;&nbsp;

							<span id="from-age-button-placeholder"></span>
						</span>
					</td>
				</tr>
			</table>

			<% otherDemogFieldRows.each { %>
				${ ui.includeFragment("kenyaui", "widget/rowOfFields", [ fields: it ]) }
			<% } %>

		</fieldset>

		<fieldset>
			<legend>Address</legend>

			<% addressFieldRows.each { %>
				${ ui.includeFragment("kenyaui", "widget/rowOfFields", [ fields: it ]) }
			<% } %>

		</fieldset>

		<fieldset>
			<legend>Treatment Supporter's</legend>

			 <% nextOfKinFieldRows.each { %>
			   ${ ui.includeFragment("kenyaui", "widget/rowOfFields", [ fields: it ]) }
			 <% } %>

		</fieldset>

		<fieldset>
			<legend>Enrollment Status</legend>

			 <% enrollmentStatus.each { %>
			   ${ ui.includeFragment("kenyaui", "widget/rowOfFields", [ fields: it ]) }
			 <% } %>

		</fieldset>

	</div>
    <div ng-controller="AddresshierarchyCtrl" data-ng-init="init()">
        
        <div>
        <tr>
        <td>State / Region:</td>
        <td>
        <select ng-model="myState" ng-options="state for state in states" ng-change="stateSelection(myState)"></select>
        </td>
        </tr>
        </div>
        
        <div>
        <tr>
        <td>Township:</td>
        <td>
        <select ng-model="myTownship" ng-options="township for township in townships" ng-change="townshipSelection(myState,myTownship)"></select>
        </td>
        </tr>
        </div>
        
        <div>
        <tr>
        <td>Town / Village:</td>
        <td>
        <select ng-model="myVillage" ng-options="village for village in villages"></select>
        </td>
        </tr>
        </div>
    </div>
	
	<div class="ke-panel-footer">
		<button  type="submit">
			<img src="${ ui.resourceLink("kenyaui", "images/glyphs/ok.png") }" /> ${ command.original ? "Save Changes" : "Create Patient and Check In" }
		</button>
		<button type="submit" style="float: right;">
			<img src="${ ui.resourceLink("kenyaui", "images/glyphs/ok.png") }" /> ${ command.original ? "Save Changes" : "Create Patient" }
		</button>
		
		<% if (config.returnUrl) { %>
		<button type="button" class="cancel-button"><img src="${ ui.resourceLink("kenyaui", "images/glyphs/cancel.png") }" /> Cancel</button>
		<% } %>
	</div>
	
</form>

<!-- You can't nest forms in HTML, so keep the dialog box form down here -->
${ ui.includeFragment("kenyaui", "widget/dialogForm", [
		buttonConfig: [ id: "from-age-button", label: "from age", iconProvider: "kenyaui", icon: "glyphs/calculate.png" ],
		dialogConfig: [ heading: "Calculate Birthdate", width: 40, height: 40 ],
		fields: [
				[ label: "Age in y/m/w/d", formFieldName: "age", class: java.lang.String ],
				[ label: "On date", formFieldName: "now", class: java.util.Date, initialValue: new Date() ]
		],
		fragmentProvider: "kenyaemr",
		fragment: "emrUtils",
		action: "birthdateFromAge",
		onSuccessCallback: "updateBirthdate(data);",
		onOpenCallback: """jQuery('input[name="age"]').focus()""",
		submitLabel: ui.message("general.submit"),
		cancelLabel: ui.message("general.cancel")
]) }

<script type="text/javascript">
	jQuery(function() {
		jQuery('#from-age-button').appendTo(jQuery('#from-age-button-placeholder'));

		jQuery('#edit-patient-form .cancel-button').click(function() {
			ui.navigate('${ config.returnUrl }');
		});

		kenyaui.setupAjaxPost('edit-patient-form', {
			onSuccess: function(data) {
				if (data.id) {
					<% if (config.returnUrl) { %>
					ui.navigate('${ config.returnUrl }');
					<% } else { %>
					ui.navigate('kenyaemr', 'registration/registrationViewPatient', { patientId: data.id });
					<% } %>
				} else {
					kenyaui.notifyError('Saving patient was successful, but unexpected response');
				}
			}
		});
	});

	function updateBirthdate(data) {
		var birthdate = new Date(data.birthdate);

		kenyaui.setDateField('patient-birthdate', birthdate);
		kenyaui.setRadioField('patient-birthdate-estimated', 'true');
	}
</script>