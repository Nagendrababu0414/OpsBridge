trigger DepartmentTrigger on Dept__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
        DepartmentHandler.updatecand(Trigger.New);
    }

}