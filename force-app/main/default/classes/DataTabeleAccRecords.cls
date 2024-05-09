public with sharing class DataTabeleAccRecords {
    @AuraEnabled(cacheable = true)
    public static List<account> getDataTable() {
     List<account> lst = [SELECT id, name FROM Account LIMIT 10];
     return lst;
    }
}