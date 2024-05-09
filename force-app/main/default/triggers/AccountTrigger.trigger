trigger AccountTrigger on Account (before update, before insert) {
    if((trigger.isUpdate || trigger.isInsert) && trigger.isBefore){
CallParams.userInputs(trigger.new);
    }
}