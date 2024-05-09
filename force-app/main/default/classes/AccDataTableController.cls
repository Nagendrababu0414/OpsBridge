public with sharing class AccDataTableController {
     @AuraEnabled(cacheable=true)
     public static List<account> accData() {
         try {
            return [SELECT id, name FROM Account LIMIT 10];  

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
 }
    @AuraEnabled(cacheable=true)
    public static list<account> accListMethod(){
        try {
            List<account> accList = [select  name from account limit 5];
            return accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }

    }