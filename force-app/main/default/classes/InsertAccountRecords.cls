public with sharing class InsertAccountRecords {
    public static void insertAccRecords(List<Account> lstAccount){
     for(Account acc : lstAccount){
         if(acc.name == 'Nagendra'){
             acc.name.addError('Sorry, You cant insert this record');
         }
    }

}
}