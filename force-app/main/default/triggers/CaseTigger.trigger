trigger CaseTigger on Case (before insert, before Update) {
    if((trigger.isUpdate && trigger.isInsert)&& trigger.isBefore){
        CaseTriggerHandler.caseStatusUpdate(trigger.new);
    }
}