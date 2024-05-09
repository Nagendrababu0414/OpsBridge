public with sharing class ContactCount {
    public static void contactsCountOnAcc(List<contact> conList) {
        set<ID> accIDs = new set<ID>();
        for(contact con : conList){
        if(con.accountID != null){
            accIDs.add(con.accountID);
        }
    }
    List<account> accList1 = new List<account>();
    LIst<account> accList = [SELECT id, name, Total_Contacts__c, (SELECT id, name FROM contacts) FROM account WHERE id IN :accIDs];
    for(account acc1 : accList){
    account acc =  new account();
    acc.id = acc1.id;
    acc.Total_Contacts__c = acc1.contacts.size();
    accList1.add(acc);
    }
    insert accList1;
    }
}