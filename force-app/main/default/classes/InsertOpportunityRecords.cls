public class InsertOpportunityRecords {
    public static void opportunityInertion(){
        List<account> oppyList = new List<account>();
        for(integer i =0; i<=50; i++){
            account oppo = new account();
            oppo.Name = 'account'+i;
            oppyList.add(oppo);
        }
        insert oppyList;
    }
}