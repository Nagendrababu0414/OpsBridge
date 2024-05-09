public class LeadTriggerHandler {
    public static void leadInsert(List<lead> ldList){
        for(lead ld : ldList){
            if(ld.LeadSource == 'Web'){
                ld.rating ='Hot';
            }
            else{
                ld.Rating='Clod';
            }
        }
    }
}