public class UpdateOppHandler {
    public static void oppUpdate(list<opportunity> oppList){
        for(opportunity opp : oppList){
            opportunity oppo = new opportunity();
            if(opp.Amount >= 25000){
                opp.Name = 'Murali';
            }
    
        }
        update oppList;
    }
    
}