trigger ContTrigger on Contact (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        AccountHandler.preventAccAssociatedContacts(trigger.new);
    }
}