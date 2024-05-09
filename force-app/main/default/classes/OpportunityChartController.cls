public with sharing class OpportunityChartController {
    @AuraEnabled(cacheable=true)
    public static List<QuarterlyAmountWrapper> getQuarterlyAmounts() {
        List<QuarterlyAmountWrapper> quarterlyAmounts = new List<QuarterlyAmountWrapper>();

        // Query Opportunities and aggregate amounts quarterly
        List<AggregateResult> aggregateResults = [SELECT CALENDAR_YEAR(CloseDate) year, CALENDAR_QUARTER(CloseDate) quarter, SUM(Amount) totalAmount
                                                 FROM Opportunity
                                                 WHERE StageName = 'Closed Won'
                                                 GROUP BY CALENDAR_YEAR(CloseDate), CALENDAR_QUARTER(CloseDate)
                                                 ORDER BY CALENDAR_YEAR(CloseDate), CALENDAR_QUARTER(CloseDate)];

        for (AggregateResult result : aggregateResults) {
            QuarterlyAmountWrapper wrapper = new QuarterlyAmountWrapper();
            wrapper.year = (Integer)result.get('year');
            wrapper.quarter = (Integer)result.get('quarter');
            wrapper.totalAmount = (Decimal)result.get('totalAmount');
            quarterlyAmounts.add(wrapper);
        }

        return quarterlyAmounts;
    }

    public class QuarterlyAmountWrapper {
        @AuraEnabled public Integer year;
        @AuraEnabled public Integer quarter;
        @AuraEnabled public Decimal totalAmount;
    }
}