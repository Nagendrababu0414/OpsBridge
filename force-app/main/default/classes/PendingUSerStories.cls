public with sharing class PendingUSerStories {
    @AuraEnabled(cacheable=true)
    public static List<User_Story__c> getPendingUserStories() {
        return [SELECT Id, Name, Status__c FROM User_Story__c WHERE Status__c = 'Pending'];
    }
    @AuraEnabled
    public static void updateStatus(List<Id> recordIds, String newStatus) {
        // to update the status of selected records
        List<User_Story__c> userStoriesToUpdate = new List<User_Story__c>();

        for (Id recordId : recordIds) {
            User_Story__c story = new User_Story__c(Id = recordId, Status__c = newStatus);
            userStoriesToUpdate.add(story);
        }

        if (!userStoriesToUpdate.isEmpty()) {
            update userStoriesToUpdate;
        }
    }
}