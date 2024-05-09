trigger SectionError on Dept__c (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        ErrorForDept.errorMsg(trigger.new);
    }
}