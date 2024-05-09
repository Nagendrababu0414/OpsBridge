public class MethodWithoutCalling {
    public MethodWithoutCalling(){
        retrieveRecords();
    }
    public void retrieveRecords(){
        List<account> accList = [SELECT id, name from account];
        system.debug('Records are'+ accList);
    }
}