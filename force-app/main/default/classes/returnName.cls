public class returnName {
    public static string returnMyName(){
        string name = 'NAgendra babu';
        system.debug('chlid class result is'+'   '+ name);
        return name;
    }
     public static integer returnAccList(){
        integer count = [SELECT count() FROM Account Where id != null];
        system.debug('The account count is ' +' '+ count);
         return count;
    }

}