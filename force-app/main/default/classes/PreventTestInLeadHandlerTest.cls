@isTest
public class PreventTestInLeadHandlerTest {
    @testSetUp
    static void setUpData(){
        Lead lone = new lead();
        lone.firstName='Bhargava';
        lone.LastName='test';
        lone.company='sessionId InfoTech';
        
        try{
              database.SaveResult result = database.insert(lone,false);
        } 
        catch(exception ee){
            string errMsg = ee.getMessage();
            
        }
    }
    @isTest
    static void methodTest(){
        integer count = [select count() from Lead Where LastName like '%test%'];
        system.assertEquals(0,count);
    }
}