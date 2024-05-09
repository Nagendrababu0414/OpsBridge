public class SizeofContactsOnAccount {
    public static void conSize(List<account> accList){
        List<contact> conlist  = new List<contact>();
        for(account acc :accList ){
            if(acc.Contact_Size__c !=null){
                for(integer i=0; i<acc.Contact_Size__c;i++){
                    contact con =  new contact();
                    con.LastName = 'Cloudfulcrum & ReleaseOwl' +i;
                    conlist.add(con);
                }
                insert conlist;
            }
        }
    }
}