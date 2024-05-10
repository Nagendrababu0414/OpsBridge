public class CustomerProjectInsertion {
    public void insertCustomerProject(List<Customer_Project__c> lst){
        List<Id> lst1 = new List<Id>();
        for(Customer_Project__c cp : lst){
            if(cp.Status__c =='Active'){
                lst1.add(cp.opportunity__c);
                
            }            
        }
        List<Opportunity> oppList = [SELECT Active_Customer_Project__c from Opportunity WHERE id in : lst1];
        for(Opportunity o: oppList) {
            if(o.Active_Customer_Project__c == false) {
                o.Active_Customer_Project__c = true;
            }
        }
        update oppList;
    }
}