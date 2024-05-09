public class PIWICLass {
    public static void rtPIWIs(){
        Integer pw = [SELECT count() FROM ProcessInstanceWorkitem];
        system.debug('retrieved pws' + pw);
        
    }
}