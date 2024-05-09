public class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Industry, Phone FROM Account LIMIT 10];
    }

    @AuraEnabled
    public static void deleteAccounts(List<Id> accountIds) {
        if (accountIds != null && accountIds.size() > 0) {
            List<Account> accountsToDelete = [SELECT Id FROM Account WHERE Id IN :accountIds];
            delete accountsToDelete;
        }
    }
}