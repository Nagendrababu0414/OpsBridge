public class DeleteSameNameAcc {
    public static void dltAcc(){
        List<account> accList = [SELECT id, name from account where name LIKE : 'Nag%' and ID NOT IN (SELECT AccountId FROM Opportunity)];
        integer cou = [SELECT count() from account];
        system.debug(cou);
        delete accList;
    }
        public static void dltOpp(){
        List<opportunity> oppList = [SELECT id, name from opportunity where name LIKE :'Un%' or name LIKE :'E%'];
            system.debug(oppList);
        delete oppList;
    }
}