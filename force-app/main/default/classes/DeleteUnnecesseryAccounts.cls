public class DeleteUnnecesseryAccounts {
    public static void deleteAccList(){
        List<account> accList =[SELECT id, name, Industry from account where name Like : 'na%' and 
                               id NOT IN (select AccountId from opportunity) and id NOT IN (SELECT AccountId from case)];
        Integer acc = [SELECT count() from account where id NOT IN (SELECT AccountId from opportunity)];
        system.debug(acc);
        List<account> accL = new List<account>();
        for(account ac: accList){
            for(integer i =0; i>1; i++){
          ac.name = 'Nagendra'+i;
                accL.add(ac);
        }
        }
        update accList;
        system.debug(accList);
    }
}