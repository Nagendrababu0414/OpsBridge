public class PIWIController {
    @AuraEnabled(cacheable=true)
    public static List<Wrapper> getPendingpws() {
        List<Wrapper> wrpList = New List<Wrapper>();
        List<ProcessInstance>piList = [SELECT Id, TargetObject.Name, ProcessDefinition.Name, Status, CompletedDate, LastActor.Name, SubmittedBy.Name, CreatedDate FROM ProcessInstance Where ProcessDefinition.Name = 'Approval pending for User story' And Status = 'Pending'];
        for(ProcessInstance pi : piList){
            Wrapper wrp = New Wrapper();
            wrp.idi = pi.Id;
            wrp.name = pi.TargetObject.Name;
            wrp.status = pi.status;
            wrp.submittedby = pi.Submittedby.Name;
            wrpList.add(wrp);
        }
        return wrpList;
    }
    @AuraEnabled
    public static void recordsApproval(List<Wrapper> pilList) {
        System.debug(pilList);
        Set<Id> recoIds = New Set<Id>();
        Set<Id> recIds = New Set<Id>();
        for(Wrapper wrp : pilList){
            recoIds.add(wrp.idi);
        }
        List<ProcessInstance> piList = [Select Id, TargetObjectId from ProcessInstance Where Id =: recoIds];
        for(ProcessInstance pi : piList){
            recIds.add(pi.TargetObjectId);
        }
        Set<Id> pIds = (new Map<Id, ProcessInstance>([SELECT Id,Status,TargetObjectId FROM ProcessInstance where Status='Pending' and TargetObjectId in :recIds])).keySet();
        Set<Id> pInstanceWorkitems = (new Map<Id, ProcessInstanceWorkitem>([SELECT Id,ProcessInstanceId FROM ProcessInstanceWorkitem WHERE ProcessInstanceId in :pIds])).keySet();
        
        List<Approval.ProcessWorkitemRequest> allReq = new List<Approval.ProcessWorkitemRequest>(); 
        for (Id pInstanceWorkitemsId:pInstanceWorkitems){
            system.debug(pInstanceWorkitemsId);
            Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
            req2.setComments('approve via apex');
            req2.setAction('Approve'); //to approve use 'Approve'
            req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
            
            // Use the ID from the newly created item to specify the item to be worked
            req2.setWorkitemId(pInstanceWorkitemsId);
            
            // Add the request for approval
            allReq.add(req2);
        }
        try{
        Approval.ProcessResult[] result2 =  Approval.process(allReq);
        }
        catch(exception e){
            System.debug(e);
        }
       
    }
    
    @AuraEnabled
    public static void recordsReject(List<Wrapper> pilList) {
        Set<Id> recoIds = New Set<Id>();
        Set<Id> recIds = New Set<Id>();
        for(Wrapper wrp : pilList){
            recoIds.add(wrp.idi);
        }
        List<ProcessInstance> piList = [Select Id, TargetObjectId from ProcessInstance Where Id =: recoIds];
        for(ProcessInstance pi : piList){
            recIds.add(pi.TargetObjectId);
        }
        Set<Id> pIds = (new Map<Id, ProcessInstance>([SELECT Id,Status,TargetObjectId FROM ProcessInstance where Status='Pending' and TargetObjectId in :recIds])).keySet();
        Set<Id> pInstanceWorkitems = (new Map<Id, ProcessInstanceWorkitem>([SELECT Id,ProcessInstanceId FROM ProcessInstanceWorkitem WHERE ProcessInstanceId in :pIds])).keySet();
        
        List<Approval.ProcessWorkitemRequest> allReq = new List<Approval.ProcessWorkitemRequest>(); 
        for (Id pInstanceWorkitemsId:pInstanceWorkitems){
            system.debug(pInstanceWorkitemsId);
            Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
            req2.setComments('approve via apex');
            req2.setAction('Reject'); //to approve use 'Approve'
            req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
            
            // Use the ID from the newly created item to specify the item to be worked
            req2.setWorkitemId(pInstanceWorkitemsId);
            
            // Add the request for approval
            allReq.add(req2);
        }
        try{
        Approval.ProcessResult[] result2 =  Approval.process(allReq);
        }
        catch(exception e){
            System.debug(e);
        }
    }
    
    public class wrapper {
        @AuraEnabled public string idi {get; set;}
        @AuraEnabled public string name {get; set;}
        @AuraEnabled public string status {get; set;}
        @AuraEnabled public string submittedby {get; set;}
    }
    
}