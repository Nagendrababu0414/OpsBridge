public class QueueableApexOnAccount implements Queueable {
    public void execute(QueueableContext cnxt){
        system.enqueueJob(new InsertOpportunityRecords());
    }
}