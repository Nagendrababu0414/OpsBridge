public class AllBatchJobProcess implements Database.Batchable<Sobject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        string str = 'SELECT Id, name from Account';
        system.debug('the list is returned');
        system.debug(Database.getQueryLocator(str));
        return Database.getQueryLocator(str);
    }
    public void execute(Database.BatchableContext bc, List<account> accList){
        for(account acc : accList){
            acc.name = 'CF' + acc.Name;
        }
        update accList; 
        system.debug('Batch class is executed');
        
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Batch class is updated');
    }
}