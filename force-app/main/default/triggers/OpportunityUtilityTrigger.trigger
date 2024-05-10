trigger OpportunityUtilityTrigger on Opportunity (before insert, after insert, after update) {
AllUtility.latestOppAmount(trigger.new);
}