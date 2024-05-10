public class LookupRollupSummaryHandler {
    public static void lookupSummary(List<contact> conList){
        List<account> accListToUpdate = new List<account>();
        List<id> listAccountIds = new List<id>();
        for(contact con :conList) {
            listAccountIds.add(con.AccountId);
        } 
       List<account> accList= [select id, name, Count_of_Contacts__c,(select id, name from contacts) from account where id =:listAccountIds];
        for(account acc : accList){
            acc.Count_of_Contacts__c = acc.contacts.size();
            accListToUpdate.add(acc);
        }
        update accListToUpdate;
    }
    /*public static void lookupSummary1(List<contact> conList){
        List<id> accAccountIds = new List<id>();
        for(contact con : conList){
            accAccountIds.add(con.accountId);
        }
        List<account> accList = [select id, name, Count_of_Contacts__c,(select id, name from contacts) from account where id =:accAccountIds];
        for(account acc : accList){
            acc.Count_of_Contacts__c = acc.contacts.size(); 
        }
        update accList;
    }*/
}