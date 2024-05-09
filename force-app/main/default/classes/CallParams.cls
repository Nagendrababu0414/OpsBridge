public class CallParams {
    public static integer counter = 0;
    public static void userInputs(List<account> accLIst){
        for(account acc:accLIst){
            if(acc.Name == 'Nagendra'){
                
                acc.Name = 'Hanwitha-Anwi'+counter;
                if(acc.Name=='Hanwitha-Anwi'){
                    acc.Name='Hanwitha-Anwi'+counter++;
                system.debug(acc.Name);
                }
            }    
        }    
    }
}