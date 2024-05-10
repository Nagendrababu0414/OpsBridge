@isTest
public class AppendWithNagendrsByBatchClassTest {
    @isTest
    public static void AppendWithNagendrsByBatchClassTest(){
        List<Account> accList = new List<Account>();
        Account acc = new Account(name='Test Account');
        accList.add(acc);
        insert accList;
        AppendWithNagendrsByBatchClass cls = new AppendWithNagendrsByBatchClass();
        Test.startTest();
        Id batchId = Database.executeBatch(cls);
        Test.stopTest();
        
        Account a1 = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals(a1.Name, 'Test Account');
    }
}