public with sharing class ContactDataController { 
    @AuraEnabled
    public static list<Contact> fetchContacts(){        
            list<Contact> lstContact =  [SELECT id,name FROM Contact LIMIT 5000];
            return lstContact;        
    }
    
}