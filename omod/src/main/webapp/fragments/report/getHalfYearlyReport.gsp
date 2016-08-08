<table style='width: 100%' class="ke-table-vertical">
<tr>
<th>
Cohort Analysis for the ${year}
</th>

<% if (halfYearly=='First Half') { %>
<th>
Jan Cohort
</th>
<th>
Feb Cohort
</th>
<th>
March Cohort
</th>
<th>
April Cohort
</th>
<th>
May Cohort
</th>
<th>
June Cohort
</th>
<% } %>

<% if (halfYearly=='Second Half') { %>
<th>
July Cohort
</th>
<th>
Aug Cohort
</th>
<th>
Sep Cohort
</th>
<th>
Oct Cohort
</th>
<th>
Nov   Cohort
</th>
<th>
Dec Cohort
</th>
<% } %>
</tr>

<tr>
<td><font face="verdana" color="red">Fill up the Year of the Cohort in each cells</font></td>
<% if (halfYearly=='First Half') { %>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<td> ${year} </td>
<% } %>
</tr>

<tr>
<td><font face="verdana" color="green">No. of Patient already on ART in this Clinic</font></td>
<% if (halfYearly=='First Half') { %>
<td>
${patientProgramForJan}
</td>
<td>
${patientProgramForFeb}
</td>
<td>
${patientProgramForMarch}
</td>
<td>
${patientProgramForApril}
</td>
<td>
${patientProgramForMay}
</td>
<td>
${patientProgramForJune}
</td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td>
${patientProgramForJuly}
</td>
<td>
${patientProgramForAugust}
</td>
<td>
${patientProgramForSeptember}
</td>
<td>
${patientProgramForOctober}
</td>
<td>
${patientProgramForNovember}
</td>
<td>
${patientProgramForDecember}
</td>
<% } %>
</tr>

<tr>
<td>Transfer In Add+ </td>
<% if (halfYearly=='First Half') { %>
<td>${patientTransferInForJan}</td>
<td>${patientTransferInForFeb}</td>
<td>${patientTransferInForMarch}</td>
<td>${patientTransferInForApril}</td>
<td>${patientTransferInForMay}</td>
<td>${patientTransferInForJune}</td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td>${patientTransferInForJuly}</td>
<td>${patientTransferInForAugust}</td>
<td>${patientTransferInForSeptember}</td>
<td>${patientTransferInForOctober}</td>
<td>${patientTransferInForNovember}</td>
<td>${patientTransferInForDecember}</td>
<% } %>
</tr>

<tr>
<td>Transfer Out Subtract- </td>
<% if (halfYearly=='First Half') { %>
<td>${patientTransferOutForJan}</td>
<td>${patientTransferOutForFeb}</td>
<td>${patientTransferOutForMarch}</td>
<td>${patientTransferOutForApril}</td>
<td>${patientTransferOutForMay}</td>
<td>${patientTransferOutForJune}</td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td>${patientTransferOutForJuly}</td>
<td>${patientTransferOutForAugust}</td>
<td>${patientTransferOutForSeptember}</td>
<td>${patientTransferOutForOctober}</td>
<td>${patientTransferOutForNovember}</td>
<td>${patientTransferOutForDecember}</td>
<% } %>
</tr>

<tr>
<td><font face="verdana" color="green">Total  Cohort for Respective month (s)</font></td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Male </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Female </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Age 0-14yr </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Age 15-24yr </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Age 25-60+yr</td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td><font face="verdana" color="green">No. of Cohort Alive & on ART in that month</font></td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>On Original First Line Regimen </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>On Alternate First Line Regimen( Substituted) </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>On Second Line Regimen (Switched) </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Stopped for any reason (medical or self) </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Died </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Lost to Follow up (DROP) </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td><font face="verdana" color="green">Percent of Cohort Alive and on ART</font></td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Number of Patient with CD4 > or equal to 200  </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>Performance Scale </td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>A-Normal activity:</td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>B-Bedridden less than 50%</td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>C-Bedridden for more than 50%</td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>No. of Persons who picked up ARVs consistently in every month for 6 mths</td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>

<tr>
<td>No. of Persons who picked up ARVs consistently in every month for 12 mths</td>
<% if (halfYearly=='First Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>

<% if (halfYearly=='Second Half') { %>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<% } %>
</tr>
</table>