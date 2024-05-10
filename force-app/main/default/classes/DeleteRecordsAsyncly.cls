public class DeleteRecordsAsyncly implements Queueable {
public void execute(queueableContext cnxt){
        list<Account> acc  = [select id, name from account where name LIKE 'CloudFC%'];
        delete acc;
    }
}