public with sharing class AccountDen {
    @AuraEnabled(cacheable=true)
    public static List<Contact> retrieveContact(string keySearch){
    List<Contact> mycontactList = [Select Id, FirstName, LastName, Email, Phone, Account.Name From Contact Where Account.Name=:keySearch];
    return mycontactList;
    }
    }