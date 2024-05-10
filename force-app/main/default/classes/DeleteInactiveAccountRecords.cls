public class DeleteInactiveAccountRecords {
    public static void dltInactiveAccounts(List<account> accList){
        List<account> accList1 = [SELECT id, name, Active__c FROM account WHERE id IN :accList];
        List<account> accList2 = new List<account>();
        for(account acc : accList1){
            if(acc.Active__c == 'no'){
                accList2.add(acc);
            }
        }
        delete accList2;
    }
}