trigger AccountUtilityTrigger on Account (before insert, before update, after update) {
   // AllUtility.ownObject(trigger.new);
    if(trigger.isBefore && trigger.isUpdate){
    AllUtility.updateNew(trigger.new, trigger.oldMap);
    }
    
if(trigger.isBefore && trigger.isUpdate){
    AllUtility.copyBillingToShipping(trigger.new);
    }
}