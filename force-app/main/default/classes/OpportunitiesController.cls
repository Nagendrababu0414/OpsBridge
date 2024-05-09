public with sharing class OpportunitiesController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityData() {
        return [SELECT Id, Name, Amount, CloseDate FROM Opportunity];
    }
}