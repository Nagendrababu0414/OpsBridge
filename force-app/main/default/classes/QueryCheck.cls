public class QueryCheck {
 public static void getCombinedData(List<string> categoryList, Date startDate) {
                System.debug('categoryLisst: ' + categoryList);
        // Query data from Sales and Services objects
        //List<SalesServiceWrapper> combinedData = new List<SalesServiceWrapper>();
        
        //List<Sales_Pro__c> salesList = [SELECT Id, Name, Sales_Amount__c, Sales_and_service_amount__c, Start_Date__c, Category__c 
                                        //FROM Sales_Pro__c WHERE Category__c IN:categoryList AND Start_Date__c =:startDate];
     Set<String> setOfValues = new Set<String>{'High-Value Customer','Standard Customer','Partner','Prospect','Active','Inactive'};

        String strMultiSelectValues = '(';

        for(String eachValue : setOfValues){
            strMultiSelectValues += '\'' +  eachValue + '\',';
        }

        strMultiSelectValues = strMultiSelectValues.removeEnd(',');
        strMultiSelectValues += ')';

        String query = 'SELECT Id, Category__c FROM Sales_Pro__c WHERE Category__C INCLUDES '+ strMultiSelectValues;

        List<Sales_Pro__c> salesList = database.query(query);
     system.debug(salesList);
     system.debug(startDate);
 }
}