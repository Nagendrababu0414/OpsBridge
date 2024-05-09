public class InsertTestaccountRecords {
    public static void insertRecords(){
        list<account> acc =new list<account>();
        for (integer counter =1; counter <= 20; counter++){
            account acc1 = new account();
            acc1.Name ='CloudFC'+counter;
           acc.add(acc1); 
        }
        insert acc;
        //system.debug('Nagendra ');
    }
}