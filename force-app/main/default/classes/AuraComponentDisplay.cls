public class AuraComponentDisplay {
 	@AuraEnabled     
    public static List<Account> getAccountDetails(String iname){ 
        String inm=iname+'%';    
        List<Account> lacc=[SELECT Id, Name, BillingCity, Phone, Industry, Rating FROM Account where Industry LIKE:inm];   
        return (lacc);    
    } 
}