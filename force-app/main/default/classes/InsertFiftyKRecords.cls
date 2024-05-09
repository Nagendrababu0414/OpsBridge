public class InsertFiftyKRecords {
    public static void bulkRecords(){
        List<account> accList = new List<account>();
        for(integer i =1; i<=9000; i++ ){
            account acc = new account();
            acc.Name = 'BulkR'+i;
            accList.add(acc);
        }
       insert accList; 
    }
}