public class AllUtility {
    public static void ownObject(List<account> accLIst){
        for(account acc : accList){
            if(acc.name!='' && acc.industry!=''){
                acc.industry = acc.name+acc.industry;
            }
        }
    }
    public static void updateNew(List<account> accList, Map<id, account> oldMap){
        system.debug('List is fetched' + accList);
        system.debug('Map is fetched' + oldMap);
        
        for(account acc:accList){
            if(acc.Description !=oldMap.get(acc.id).Description){
                acc.Description = 'new description';
            }
            system.debug(acc);
        }
        
    }
    public static void latestOppAmount(List<opportunity> oppList){
        List<account> accList = new List<account>();
        for(opportunity opp : oppList){
            if(opp.accountId!=null && opp.amount != null){
                account acc = new account();
                acc.id = opp.AccountId;
                acc.Opp_Latest_Amount__c = opp.amount;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void copyBillingToShipping(List<account> accList){
        for(account acc : accList){
            if(acc.BillingCity !='' && acc.BillingCountry !=''){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
            }
        }
    }
    /* Id currentUserId = UserInfo.getUserId();
    Id[] nextApproverIds = new Id[]{currentUserId};
        req2.setNextApproverIds(nextApproverIds);
*/
}