public with sharing class AccData {
@AuraEnabled(cacheable=true)
public static List<contact> accData1(){
    try {
        List<contact> accList =[SELECT Id, LastName FROM contact LIMIT 10];
        return accList;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}
    
}