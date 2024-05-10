public class PipelineCreationClass {
    public static void modify(Map<Id,account>oldData,Map<Id,account>newData ){
        for(account nD : newData.values()){
            system.debug(oldData.get(nD.Id));
           }
        }
    }