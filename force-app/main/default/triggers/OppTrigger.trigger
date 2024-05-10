trigger OppTrigger on Opportunity (before delete) {
    if(trigger.isbefore && trigger.isDelete){
    }
}