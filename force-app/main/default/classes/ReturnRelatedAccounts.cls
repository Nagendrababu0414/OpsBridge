public class ReturnRelatedAccounts {
    @auraEnabled(cacheable=true)
     public static accountWrapper rtAccounts(){
         set<id> accSet = new set<id>();
        List<account> accList = [SELECT id, name from Account where name =:'HI'];
         for(account acc : accList){
             accSet.add(acc.id);
         }
         List<contact> conList = [select id, name from contact where accountID in: accSet]; 
         List<case> csList = [select id, priority from case where accountID in:accSet];
         accountWrapper accWrapper = new accountWrapper();
         accWrapper.accountList = accList;
         accWrapper.contactList =conList;
         accWrapper.caseList = csList;
        return accWrapper;
         //system.debug(accWrapper);
    }
    public class accountWrapper{
        public list<account> accountList;
        public list<contact> contactList;
        public list<case> caseList;
    }
}