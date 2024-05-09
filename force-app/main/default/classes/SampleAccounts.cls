public class SampleAccounts {
    public static void tenAccounts(){
       List<contact> conLIst = new List<contact>();
        for(integer i =0; i<10; i++){
            contact con = new contact();
            con.accountId = '0015j00001WezIIAAZ';
            con.LastName = 'Hans' + i;
            con.Description = 'Iam a Han'+i+ 'in Han list';
            conLIst.add(con);
        }
        insert conLIst;
    }
}