public with sharing class CreateContactOnAccount {
    public static void createContactOnAcc(List<account> accList) {
    List<contact> conList = new List<contact>();
    for(account acc : accList){
        contact con = new contact();
        con.FirstName = 'Sudha';
        con.LastName = 'Nagendra' + acc.Name;
        con.Email = 'sudha@gmail.com';
        con.phone = '9502380761';
        con.AccountId = acc.Id;
        conList.add(con);
       }
       insert conList;
    }
}