public class ChecckPrimaryContactForAcccount {
    public static void updatePrimaryContact(List<contact> conList){
        set<id> accIds = new set<id>();
        for(contact con : conList){
            accIds.add(con.AccountId);
            }
        Map<id,contact> conMap =  new Map<id,contact>(
                                 [SELECT id, name,Primary_Contact_for_Account__c from contact
                                  where accountId !=null and Primary_Contact_for_Account__c = true]);
        
                for(contact con : conList){
              if(con.Primary_Contact_for_Account__c){
                  if(conMap.containsKey(con.AccountId) && conMap.get(con.AccountId).Id != con.Id){
                      con.Primary_Contact_for_Account__c.addError('Ony One primary Contact for one Account');
                  
            }
        }
      
        }
    }
}