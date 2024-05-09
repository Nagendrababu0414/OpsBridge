public class PreventDeletingActiveAccount {
    public static void preventdltactiveaccount(List<account> accList){
        for(account acc : accList){
            if(acc.active__c == 'yes'){
                acc.addError('can`t delete active account record');
                system.debug('Can`t delete');
            }
        }
    }
}