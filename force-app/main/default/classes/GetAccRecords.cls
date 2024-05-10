public with sharing class GetAccRecords {
    @AuraEnabled(cacheable = true)
    public static  List<Account> getAccRecords1() {
     List<account> accList1 = [SELECT id, name FROM Account LIMIT 2];
      return accList1;
    }
}