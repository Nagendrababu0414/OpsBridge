public class ImplementedInterface implements OverRideInteface, SecondInterface {
    public static void overRideInterfaceMethod(){
        string name = returnName.returnMyName();
        system.debug('this is name from getting another class is'+'  '+name);
    }
        public static void secondInterfaceMethod(){
            string surName = 'Dharanikota';
            system.debug('This is my surName' +'    ' + surName);
        }
    public static void returnAccList(){
        integer accCount = returnName.returnAccList();
        integer count = [SELECT count() FROM contact Where id != null];
        system.debug('The ConList is ' +' '+ count);
    }
    }