trigger ConTrigger on Contact (before delete) {
    if(trigger.isbefore && trigger.isDelete){
PreventDeleteOpp.preventOpp(trigger.old);
    }
}