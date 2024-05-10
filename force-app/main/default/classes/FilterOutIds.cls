public class FilterOutIds {
    public static void filterIds(){
        List<account> accList=[SELECT id , name FROM Account where id != ''];
        set<id> accIds = new set<id>();
        for(account acc : accList){
            accIds.add(acc.id);
        }
        List<account> acList = [SELECT id, name FROM Account where id IN :accIds];
        system.debug('new account list is'+''+acList);
    }
}