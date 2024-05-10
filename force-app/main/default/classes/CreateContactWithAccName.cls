public class CreateContactWithAccName {
    public static void createConByAccount(List<account> accList){
        List<contact> conList = new List<contact>();
        for(account acc : accList){
           contact con = new contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            con.Phone = acc.Phone;
            con.Description= acc.Description;
            conList.add(con);
        }
        insert conList;
    }
}