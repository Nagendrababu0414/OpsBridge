public class PreventTestInLeadHandler {
    public static void preventTest(List<lead> ldList){
        for(lead ld : ldList){
            if(ld.LastName.contains ('test')){
              ld.addError('Test is not accepted'); 
            }
        }
    }
}