public class ContactTriggerHandler {
    public static void rollupOnInsertion(List<contact> conList){
        set<account> accSet = new set<account>();
        for(contact con: conList){
           account acc = new account();
            acc.id = con.accountID;
            acc.Name = con.Name;
            accSet.add(acc);
            system.debug('Flowing');
        }
        List<account> accLst = new List<account>();
        List<account> accList =[SELECT id, name,Count_of_Contacts__c, (select id, name from contacts) from Account where id IN:accSet ];
        account ac = new account();
        ac.Count_of_Contacts__c = conList.size();
        accLst.add(ac);
        insert accLst;
    }
}