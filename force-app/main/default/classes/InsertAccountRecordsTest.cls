@isTest
private with sharing class InsertAccountRecordsTest {
    @TestSetUp
     static void setUpTestData() {
        List<Account> lstAccount = new List<Account>();
        for(integer counter = 1; counter <10; counter++){
        Account acc = new Account();
        acc.Name ='VsAccount'+counter;
        acc.Rating ='hot';
        lstAccount.add(acc);
       }
            insert lstAccount;
         
     }
    @isTest
    static void testMethodOne (){
        Integer count = [select count() from Account where name Like 'VsAccount%'];
        system.assertEquals(9,count);
    }
}
        /*catch(exception e){
            system.debug('failed to insert the records');
        }
    }
    @istest
    static void testMetodOne(){
     List<Account> accList = [select Id from Account Where name Like 'VsAccount_'];
        system.assertEquals(9,accList.size());
    }
    
}


/*
 
public with sharing class InsertAccountRecords {
    public static void insertAccRecords(){
     List<Account> lstAccount = new List<Account>();
     for(integer counter = 1; counter <10; counter++){
     Account acc = new Account();
     acc.Name ='Vs Account'+counter;
     acc.Rating ='hot';
     lstAccount.add(acc);
    }*/