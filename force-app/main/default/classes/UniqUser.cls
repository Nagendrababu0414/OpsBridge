public class UniqUser {
    public static void accUser(Map<id,account> accMap){
            Id userId = '0055j00000AUpkeAAD';

       List<account> accList = new List<account>(accMap.values());
        system.debug(accList);
        for(account acc:accList){
            if(acc.lastmodifiedby.Id !=null){
                acc.LastModifiedBy.Id = userId;
            }
        }
    }
}