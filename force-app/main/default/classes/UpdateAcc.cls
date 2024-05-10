public class UpdateAcc {
    public static void upAcc(){
        List<account> accList = [select id, name,industry from account where industry!=null];
List<account> acList = new List<account>();
for(account acc : accList){
    if(acc.industry!= null){
        acc.Rating = 'Hot';
    }
    acList.add(acc);
}
system.debug(acList);
update acList;
    }
}