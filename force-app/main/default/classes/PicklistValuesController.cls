public with sharing class PicklistValuesController {
    @AuraEnabled(cacheable=true)
    public static List<String> getAccountRatingPicklistValues() {
        List<String> picklistValues = new List<String>();
        Schema.DescribeFieldResult fieldResult = Account.Rating.getDescribe();
        for (Schema.PicklistEntry ple : fieldResult.getPicklistValues()) {
            picklistValues.add(ple.getLabel());
        }
        return picklistValues;
    }
}