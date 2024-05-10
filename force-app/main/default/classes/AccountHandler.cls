public class AccountHandler {
    public static void preventAccAssociatedContacts(List<contact> conList){
        set<id> accIds = new set<Id>();
        
        for(contact con : conList){
            if(con.accountId !=null){
               accIds.add(con.accountId);
            }
        }
        List<account> conList1=[SELECT id, (select name, accountId from contacts) from account where Id In:accIds];
        for(account ac : conList1){
            ac.Count_of_Contacts__c = ac.contacts.size();
        }
            update conList1;

    }

}