public class InsertOneLakhRecords implements Database.Batchable<SObject>{
    public database.QueryLocator start(database.BatchableContext bcnxt){
        string s = 'select id, name from Dummy_Object__c';
        return database.getQueryLocator(s);
    }
    public void execute(database.BatchableContext bcnxt, List<Dummy_Object__c> dmList){
      List<Dummy_Object__c> dml = new List<Dummy_Object__c>();
        for(integer counter =0; counter>100000; counter++) {
            Dummy_Object__c dm = new Dummy_Object__c();
            dm.name ='Dummy'+counter;
            dml.add(dm);
        } 
        insert dml;
    }
    public void finish(database.BatchableContext bcnxt){
        
        
    }
}