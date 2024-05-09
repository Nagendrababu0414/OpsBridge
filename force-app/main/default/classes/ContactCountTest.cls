@isTest
public class ContactCountTest {
    @isTest
    public static void contactCountTest() {
        List<Contact> conList = new List<Contact>();
        Account acc1 = new Account(Name = 'TestAccount1');
        insert acc1;
        Contact c1 = new Contact(LastName = 'TestContact1', AccountId = acc1.Id);
        insert c1;
        Contact c2 = new Contact(LastName = 'TestContact2', AccountId = acc1.Id);
        insert c2;
        Contact c3 = new Contact(LastName = 'TestContact3', AccountId = acc1.Id);
        insert c3;
        
        conList.add(c1);
        conList.add(c2);
        conList.add(c3);
        
        Test.startTest();
        ContactCount.contactsCountOnAcc(conList);
        Test.stopTest();
        
        Account acc2 = [Select Total_Contacts__c from Account where Id = :acc1.Id];
        System.assertEquals(3, acc2.Total_Contacts__c);
            }
}