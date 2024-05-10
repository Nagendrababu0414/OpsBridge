public class ChangeOwner {
    public static void changeContactsOwner(List<account> accList, Map<ID, account> accMap){
        set<ID> accIds = new set<ID>();
        for(account acc: accList){
            if(acc.ID!=null){
            accIds.add(acc.ID); 
            }
        }
        List<contact> cons = [select id, name, AccountID from contact where AccountID IN : accIds];
    }
}