public class AppendWithNagendrsByBatchClass implements database.Batchable<SObject>{
    public database.QueryLocator start(database.BatchableContext cnxt){
        string str = ('select id, name from account');
        return database.getQueryLocator(str);
    }
    public void execute(database.BatchableContext cnxt,List<account> accList){
        for(account acc : accList){
            acc.name = acc.name;
        }
        update accList;
    }
    public void finish(database.BatchableContext cnxt){
        system.debug('Nagendra');
        
    }
}