public class InputPars {
    public static void inpIds(List<Id> recordIds){
        List<account> accList = [select id, name from account where Id In:recordIds];
        system.debug(accList);
    }
}