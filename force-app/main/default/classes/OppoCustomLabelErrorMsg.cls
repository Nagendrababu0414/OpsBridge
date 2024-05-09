public class OppoCustomLabelErrorMsg {
    public static void customLabelMsg(List<opportunity> oppList){
        for(opportunity opp : oppList){
            if(opp.StageName == 'Prospecting'){
                opp.addError('can not delete');
            }
        }
    }
}