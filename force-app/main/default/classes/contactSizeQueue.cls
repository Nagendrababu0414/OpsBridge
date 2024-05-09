public class contactSizeQueue implements Queueable {
    
    private List<Account> accList;
    
    public contactSizeQueue(List<Account> accList) {
        this.accList = accList;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> conlist = new List<Contact>();
        
        for(Account acc : accList) {
            if(acc.Contact_Size__c != null && acc.Contact_Size__c > 0) {
                for(Integer i = 0; i < acc.Contact_Size__c; i++) {
                    Contact con = new Contact();
                    con.LastName = 'CloudFulCrum' + i;
                    conlist.add(con);
                }
            }
        }
        
        if(!conlist.isEmpty()) {
            insert conlist;
            
            // Update Account custom field after Contact creation
            for(Account acc : accList) {
                acc.Status_of_contacts__c = 'Contact Created';
            }
            update accList;
        }
    }
}