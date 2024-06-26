public with sharing class FAQController {
    @AuraEnabled(cacheable=true)
    public static List<FAQ__c> getFAQs() {
        return [SELECT Id, Question__c, Answer__c FROM FAQ__c];
    }
}