trigger ContactTrigger on Contact (after insert, before insert, before update) {
    if(trigger.isInsert && trigger.isAfter){
        ContactTriggerHandler.rollupOnInsertion(trigger.new);
    }
     if((trigger.isInsert || trigger.isUpdate) && trigger.isBefore){
        ChecckPrimaryContactForAcccount.updatePrimaryContact(trigger.new);
    }
}