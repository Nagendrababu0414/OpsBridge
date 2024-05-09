public class ServiceProHandler {
    public static void totalSalesAndServiceAmount(List<Services_Pro__c> srList){
       set<ID> slIds = new set<ID>();
        for(Services_Pro__c sr : srList){
            if(sr.Sales_Pro__c!= null){
              slIds.add(sr.Sales_Pro__c);
            }
        }
        List<Sales_Pro__c> slList = [SELECT Id, Sales_Amount__c, Sales_and_service_amount__c
                                      
                                     FROM Sales_Pro__c where Id IN:slIds];
    }
}