public class AccountRecordsDisplay {
    @auraEnabled
    public static list<account> accList(){
        list<account> acc =[select Name,BillingAddress,Industry from account];
        return(acc);
    }
}