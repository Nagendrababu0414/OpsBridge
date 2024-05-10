public with sharing class SalesServiceDummyController {
        @AuraEnabled(cacheable=true)
        public static List<SalesServiceWrapper> getCombinedData(Date startDate) {
            // Query data from Sales and Services objects
            List<SalesServiceWrapper> combinedData = new List<SalesServiceWrapper>();
    
                                            /* Set<String> setOfValues = new Set<String>{'High-Value Customer','Standard Customer','Partner','Prospect','Active','Inactive'};
    
                                             String strMultiSelectValues = '(';
                                     
                                             for(String eachValue : setOfValues){
                                                 strMultiSelectValues += '\'' +  eachValue + '\',';
                                             }
                                     
                                             strMultiSelectValues = strMultiSelectValues.removeEnd(',');
                                             strMultiSelectValues += ')';
                                     
                                             String query = 'SELECT Id,Name,Sales_Amount__c, Sales_and_service_amount__c, Start_Date__c, Category__c FROM Sales_Pro__c WHERE Category__C INCLUDES '+ strMultiSelectValues;
                                     
                                             List<Sales_Pro__c> salesList = database.query(query);
                                          system.debug(salesList);
                                          system.debug(startDate);
                              //List<Sales_Pro__c> salesList = Database.query(query);*/
            List<Sales_Pro__c> salesList =[SELECT id, Name, Category__c, Sales_Amount__c,Start_Date__c FROM Sales_Pro__c WHERE Start_Date__c <:startDate];
            system.debug(salesList);
            List<Services_Pro__c> servicesList = [SELECT Id, Name, Service_Amount__c,Sales_Pro__c FROM Services_Pro__c];
            system.debug(servicesList);
            // Combine data and perform calculations
            for (Sales_Pro__c sales : salesList) {
                SalesServiceWrapper wrapper = new SalesServiceWrapper();
                wrapper.Id = sales.Id;
                wrapper.Name = sales.Name;
                wrapper.SalesAmount = sales.Sales_Amount__c;
                //wrapper.salesServiceAmount=sales.Sales_and_service_amount__c;
                wrapper.Category=sales.Category__c;
                wrapper.StartingDate = sales.Start_Date__c;
                // Find corresponding service record, if any
                Services_Pro__c service = findServiceRecord(servicesList, sales.Id);
                if (service != null) {
                    wrapper.ServiceAmount = service.Service_Amount__c;
                }
    
                combinedData.add(wrapper);
            }
           system.debug(combinedData);
            return combinedData;
        }
    
        private static Services_Pro__c findServiceRecord(List<Services_Pro__c> servicesList, Id salesId) {
            for (Services_Pro__c service : servicesList) {
                if (service.Sales_Pro__c == salesId) {
                    return service;
                }
            }
            return null;
        }
    
        public class SalesServiceWrapper {
            @AuraEnabled public Id Id;
            @AuraEnabled public String Name;
            @AuraEnabled public Decimal SalesAmount;
            @AuraEnabled public Decimal ServiceAmount;
            @AuraEnabled public Decimal salesServiceAmount;
            @AuraEnabled public String Category;
            @AuraEnabled public Date StartingDate;
           //@auraEnabled public String[] CategoriesList;
    
            
        }
    }