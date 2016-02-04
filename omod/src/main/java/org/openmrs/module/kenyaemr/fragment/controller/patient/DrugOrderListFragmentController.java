package org.openmrs.module.kenyaemr.fragment.controller.patient;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.openmrs.DrugOrder;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.Person;
import org.openmrs.api.context.Context;
import org.openmrs.module.kenyaemr.api.KenyaEmrService;
import org.openmrs.module.kenyaemr.model.DrugObsProcessed;
import org.openmrs.module.kenyaemr.model.DrugOrderObs;
import org.openmrs.module.kenyaemr.model.DrugOrderProcessed;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.FragmentParam;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestParam;

public class DrugOrderListFragmentController {
	public void controller(@FragmentParam("patient") Patient patient,FragmentModel model,HttpServletRequest request) {
        Person person=Context.getPersonService().getPerson(patient);
		List <DrugOrder> drugOrders=Context.getOrderService().getDrugOrdersByPatient(patient);
        List <DrugOrderProcessed> drugOrderProcessed=new LinkedList <DrugOrderProcessed>();
        KenyaEmrService kes = (KenyaEmrService) Context.getService(KenyaEmrService.class);
        HttpSession session = request.getSession();
        String dispensedDate=(String) session.getAttribute("dispensedDate");
        Date dispensedDatee = null;
        try {
			dispensedDatee  = parseDate(dispensedDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        List<Obs> obss=kes.getObsGroupByDateAndPerson(dispensedDatee,person);
        List<DrugOrderObs> drugOrderObs=new LinkedList<DrugOrderObs>();
        for(Obs obs:obss){
        	obs.getObsGroupId();
        	List <Obs> obsDrugOrders=kes.getObsByObsGroup(obs);
        	DrugOrderObs drugOrder=new DrugOrderObs();
        	for(Obs obsDrugOrder:obsDrugOrders){
        		if(obsDrugOrder.getConcept().getUuid().equals("163079AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
        			drugOrder.setDrug(obsDrugOrder.getValueCoded().getName().toString());	
        		}
        		else if(obsDrugOrder.getConcept().getUuid().equals("163096AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
        			drugOrder.setDrug(obsDrugOrder.getValueCoded().getName().toString());		
        		}
                else if(obsDrugOrder.getConcept().getUuid().equals("163020AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
                	drugOrder.setDrug(obsDrugOrder.getValueCoded().getName().toString());		
        		}
        		
                if(obsDrugOrder.getConcept().getUuid().equals("1443AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
                	drugOrder.setFormulation(obsDrugOrder.getValueNumeric().toString());	
        		}
                
                if(obsDrugOrder.getConcept().getUuid().equals("1444AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
                	drugOrder.setStrength(obsDrugOrder.getValueText());	
        		}
                
                if(obsDrugOrder.getConcept().getUuid().equals("160855AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
                	drugOrder.setFrequency(obsDrugOrder.getValueCoded().getName().toString());		
        		}
                
                if(obsDrugOrder.getConcept().getUuid().equals("159368AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")){
                	drugOrder.setDuration(obsDrugOrder.getValueNumeric().toString());	
        		}
        	}
        	 drugOrder.setObsGroupId(obs.getObsId());
        	 drugOrderObs.add(drugOrder);
        }
        for(DrugOrder drugOrder:drugOrders){
        	DrugOrderProcessed drugOrderProcessedd=kes.getDrugOrderProcessed(drugOrder);
        	drugOrderProcessed.add(drugOrderProcessedd);
        }
		model.addAttribute("count",1);
		model.addAttribute("drugOrderProcesseds",drugOrderProcessed);
		model.addAttribute("drugOrderObss",drugOrderObs);
	}
	
	public String processDrugOrder(HttpServletRequest request,@RequestParam(value = "drugOrderProcessedIds", required = false) String[] drugOrderProcessedIds,
			@RequestParam(value = "obsGroupIds", required = false) String[] obsGroupIds,UiUtils ui) {
		KenyaEmrService kes = (KenyaEmrService) Context.getService(KenyaEmrService.class);
		for (String drugOrderProcessedId : drugOrderProcessedIds) {
			Integer drugOrderProcessId = Integer.parseInt(drugOrderProcessedId);
			String issuedQuantity = request.getParameter(drugOrderProcessedId+"issueQuantity");	
			DrugOrderProcessed drugOrderProces=kes.getDrugOrderProcesedById(drugOrderProcessId);
			drugOrderProces.setProcessedStatus(true);
			drugOrderProces.setQuantityPostProcess(Integer.parseInt(issuedQuantity));
			kes.saveDrugOrderProcessed(drugOrderProces);
		}
		
		for (String obsGroupId : obsGroupIds) {
			Integer obsGrouppId = Integer.parseInt(obsGroupId);
			String issuedQuantity = request.getParameter(obsGroupId+"obsIssueQuantity");
			DrugObsProcessed drugObsProcessed=new DrugObsProcessed();
			Obs obs=Context.getObsService().getObs(obsGrouppId);
			obs.setComment("1");
			kes.saveOrUpdateObs(obs);
			
			drugObsProcessed.setCreatedDate(new Date());
			drugObsProcessed.setObs(obs);
			drugObsProcessed.setQuantityPostProcess(Integer.parseInt(issuedQuantity));
			kes.saveDrugObsProcessed(drugObsProcessed);
		}
		//return "redirect:" + ui.pageLink(EmrConstants.MODULE_ID, "dispensary/dispensing",SimpleObject.create("patientId", null));
		return null;
		
	}
	
	private  Date parseDate(String s) throws ParseException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (s == null || s.length() == 0) {
			return null;
		} else {
			if (s.length() == 10) {
				s += " 00:00:00";
			}
			return df.parse(s);
		}
	}
}
