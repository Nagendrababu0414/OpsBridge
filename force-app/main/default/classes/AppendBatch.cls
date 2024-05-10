public with sharing class AppendBatch implements Database.Batchable <Sobject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
       return Database.getQueryLocator('Select id, name from account');
    }
    public void execute(Database.BatchableContext bc, List<account> fromStartMethod){
        for(account acc : fromStartMethod){
            acc.name = 'CFC -'+acc.name;
        }
        update fromStartMethod;
    }
    public void finish(Database.BatchableContext bc){}
}