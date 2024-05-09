public class PIWI {
    public static void PIWs(){
List<ProcessInstanceWorkitem> PIWIs = [SELECT Id FROM ProcessInstanceWorkitem];
        system.debug('PWS are'+''+PIWIs);
}
}