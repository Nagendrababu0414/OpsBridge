public with sharing class ServiceProController {
    @AuraEnabled(cacheable=true)
    public static List<Services_Pro__c> getServiceProData(String name, Decimal amount) {
        String query = 'SELECT Id, Name, Service_Amount__c FROM Services_Pro__c WHERE ';
        List<String> conditions = new List<String>();
        if (String.isNotBlank(name)) {
            conditions.add('Name LIKE :name');
        }

        if (amount != null) {
            conditions.add('Service_Amount__c = :amount');
        }

        if (!conditions.isEmpty()) {
            query += String.join(conditions, ' AND ');
        } else {
            // If no conditions, provide a default condition to retrieve all records
            query += 'Id != null';
        }
List<Services_Pro__c> srList = Database.query(query);
        system.debug(srList);
        system.debug(query);
        return srList;
    }
}