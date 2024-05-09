public class RemoveAccountAppend {
    public static void removeAppend(){
        List<account> accList = [select id, name from account];
        for(account acc :accList){
            if(acc.name !='empty'){
               
            }
        }
    }
}