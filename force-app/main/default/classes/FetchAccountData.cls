public with sharing class FetchAccountData {
    @AuraEnabled(cacheable = true)
    public static List<account> accData() {
List<account> accList= [SELECT id, name, industry from account where name !='' and industry !=''];
return accList;
    }
}