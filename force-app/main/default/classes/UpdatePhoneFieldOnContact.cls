public class UpdatePhoneFieldOnContact {
    public static void phoneFieldUpdateOnDetails(List<contact> conList){
        set<Id> accIds = new set<Id>();
        for(contact con : conList){
            accIds.add(con.AccountId);
        }
        List<contact> cnList = [SELECT id, name, phone, accountID from contact where phone != null and accountId IN : accIds];
        for(contact co : cnList){
            if(!cnList.isEmpty()){
              account acc = new account();
                acc.phone = co.Phone;
            }
        }
        update cnList;
    }
}