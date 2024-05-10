public class DeleteNCRecordsAsyncly implements Queueable {
    public void execute(QueueableContext cnxt){
        List<account> accList = [select id, name from account where name=:'NagendraNagendra--DELL'];
       delete accList;
    }
}