public with sharing class UserStoryController {
    @AuraEnabled
    public static void updateRecordStatus(List<Id> recordIds) {
        List<User_Story__c> userStoriesToUpdate = new List<User_Story__c>();

        for (Id recordId : recordIds) {
            User_Story__c userStory = new User_Story__c(
                Id = recordId,
                Status__c = 'Approved'
            );
            userStoriesToUpdate.add(userStory);
        }

        if (!userStoriesToUpdate.isEmpty()) {
            update userStoriesToUpdate;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<User_Story__c> getPendingUserStories() {
        return [SELECT Id, Name, Status__c FROM User_Story__c WHERE Status__c = 'Pending'];
    }
}