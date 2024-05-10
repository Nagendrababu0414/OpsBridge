public class FetchInactiveAccounts {
    public static void inActiveAccounts(){
        List<account> accList = [SELECT id, name, Active__c FROM account WHERE Active__c !='Yes'];
        delete accList;
    }
}