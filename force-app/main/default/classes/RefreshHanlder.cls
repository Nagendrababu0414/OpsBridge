public with sharing class RefreshHanlder {
    @AuraEnabled(cacheable = true)
       public static List<account> refreshMethod() {
            Return [SELECT id,name,industry FROM Account];
}
}