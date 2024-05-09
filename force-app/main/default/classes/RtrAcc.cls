public with sharing class RtrAcc {
    @AuraEnabled(cacheable=true)
    public static List<account> getAccountList() {
        List<account> acclist = [SELECT id, name from Account LIMIT 5];
            return acclist; 
    }
   
}