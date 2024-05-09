public class CountofOpportunityLineItem {
    public static void countofOLI(List<OpportunityLineItem> OLIList){
        set<ID> oppIds = new set<ID>();
        for(OpportunityLineItem oli : OLIList){
            if(oli.OpportunityId != null){
                oppIds.add(oli.OpportunityId);
            }
        }
        List<opportunity> opList = new List<opportunity>();
        List<opportunity> oppList = [SELECT id, Name,CloseDate, StageName, Amount, Type, LeadSource, OLI_size__c from opportunity where ID in:oppIds];
        for(opportunity opp :oppList){
            opportunity opp1 = new opportunity();
            opp1.id = opp.Id;
            opp1.CloseDate =opp.CloseDate;
            opp1.Name = opp.Name;
            opp1.Amount = opp.Amount;
            opp1.LeadSource = opp.LeadSource;
            opp1.StageName = opp.StageName;
            opp1.OLI_size__c = opp.OpportunityLineItems.size();
            opList.add(opp1); 
    }
        insert opList;
    }
}