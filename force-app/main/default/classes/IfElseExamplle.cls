public class IfElseExamplle {
    public static void ifElse(){
        List<account> accList = [SELECT id, Name, AnnualRevenue from Account];
        for(account accL : accList){
            account acc = new account();
            if(acc.AnnualRevenue >= 25000){
                acc.Active__c = 'Yes';
            }
            else{
                acc.Active__c ='No';
            }
                    accList.add(accL);
        }
        update accList; 
    }
}