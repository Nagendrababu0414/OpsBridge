public class DepartmentHandler {
    public static void updatecand(List<Dept__c> deptlist){
       List<Candidate__c> cdList = new List<Candidate__c>();
        for(Dept__c dep:deptlist ){
            if(dep.Name!=''){
                for(integer i=1; i<5;i++){
                      Candidate__c can = new Candidate__c();

                can.Name = dep.Name;
                  cdList.add(can);        
                }
                
            }
        }
        insert cdList;
     }
    
    

}