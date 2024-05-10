public class SOQLCentral1 {
    public static void soqlCentral(){
        List<account> accList =[select id, name, AnnualRevenue from account where AnnualRevenue>50000];
        for(account acc:accList){
          //account acc =new account();  
        if(acc.AnnualRevenue>50000){
        acc.Name ='NagendraSudhaAnwi';
        }
        } 
             update accList;
    }
    public static void deleteColdRecords(){
        List<account> accList = [select id,name, Active__c from account];
        system.debug(accList.size());
       /* for(account acc : accList){
            if(acc.Active__c == 'No'){
                
            }
            delete accList;
        } */
    }
    public static void dynamicUpdate(List<account> accList){
        //accList = [select id, name from account where name = accList.Name];
        for(account acc:accList){
            if(acc.Active__c =='Yes'){
                acc.Rating = 'Hot';
            }
        }
        update accList;
    }
}