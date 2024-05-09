public with sharing class OpportunityHandler {
    public static void opportunityAmountAddedOnInsertion(list<opportunity> oppList) {
        set<ID> accIDs = new set<ID>();
        for(opportunity opp : oppList){
            if(opp.AccountID != null){
            accIDs.add(opp.AccountID);
            }
        }
    list<account> accList =[SELECT id, name, Total_Opportunity_Amount__c, (SELECT id FROM opportunities) FROM Account WHERE id IN : accIDs];
    List<account> accList1 = new List<account>();
    for(account acc : accList){
        account acc1 = new account();
        acc1.id = acc.id;
        acc1.Total_Opportunity_Amount__c = acc.opportunities.size();
       acc1.name = acc.name;
        accList1.add(acc1);
    }
    update accList1;
    }
    public static void dltOppos(){
        list<opportunity> oppList =[SELECT Id, Amount, StageName, Name, CloseDate, Type FROM Opportunity where AccountId ='0015j00000WWBpxAAH' ];
        system.debug(oppList);
        delete oppList;
    }
    }