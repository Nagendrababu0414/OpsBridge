public with sharing class ErrorDept {
    public static void errorMsg(List<Dept__c> dptList){
        for(Dept__c dpt : dptList){
            if(dpt.section__c == null){
                dpt.section__c.addError('Plz enter section');
            }
        }
    }
    }