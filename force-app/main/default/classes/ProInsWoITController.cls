public with sharing class ProInsWoITController {
    @AuraEnabled(cacheable=true)
    public static List<ProcessInstanceWorkitem> getPendingpws() {
        return [SELECT Id, ProcessInstanceId FROM ProcessInstanceWorkitem];
    }
}