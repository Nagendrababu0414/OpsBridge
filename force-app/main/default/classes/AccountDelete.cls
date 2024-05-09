public class AccountDelete {
    public static void preventDelete(List<account> accList){
        
        for(account acc: accList){
            List<contact> conList  = [SELECT id, LastName, AccountID from contact where accountId =:acc.ID];
        }
    }
}