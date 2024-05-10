trigger OpportunityTrigger on Opportunity (before insert, after insert) {
if((trigger.isInsert && trigger.isUpdate)  && trigger.isAfter){
    OpportunityHandler.opportunityAmountAddedOnInsertion(trigger.new);
}
    }