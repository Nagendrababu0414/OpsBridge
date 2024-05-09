public with sharing class AccountControler {
    @AuraEnabled(cacheable=true)
    public static void updateAccountData(List<Account> data) {
        try {
            update data;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountData() {
        return [SELECT Id, Name, Industry FROM Account LIMIT 10]; 
    }
}