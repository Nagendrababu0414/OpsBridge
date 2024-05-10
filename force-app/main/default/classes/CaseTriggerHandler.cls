public class CaseTriggerHandler {
    public static void caseStatusUpdate(List<case> caseList){
        //List<case> csList = [SELECT origin, Status, CaseNumber FROM Case];
        for(case cs : caseList){
            if(cs.Origin =='Email'){
                cs.Status = 'Working';
            } 
            if(cs.Origin =='Email'){
                cs.Priority = 'High';
            } 

        }
    }
}