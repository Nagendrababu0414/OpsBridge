public class AccountInsert {
    public void hundredReocrds(List<Account> lst){
        //List<Account> lst = new List<Account>();
        for(Account acc : lst ){
            acc.Name = 'Nagendra--' + acc.Name ; 
            acc.Active__c = 'yes'; 
        
        }
    } 
}