trigger SampleAcc on Account (before insert, before update, after insert) {
    if(trigger.isInsert && trigger.isAfter){
        ApexContains.createContactForAcc(trigger.new);
    }
    
}