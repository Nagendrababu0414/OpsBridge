public class AccountApexShare {
    public static void accountShare(){
        Lead ld = [select id, LastName, Company, Status from lead where id = '00Q5j00000N3hU0EAJ' limit 1];
        LeadShare accShare = new LeadShare();
        accShare.id = ld.id;
        accShare.UserOrGroupId = '0055j000006ahVxAAI';
       accShare.leadaccesslevel = 'Edit';
        system.debug('Shared record is '+' '+accShare );
        insert accShare;
    }
}