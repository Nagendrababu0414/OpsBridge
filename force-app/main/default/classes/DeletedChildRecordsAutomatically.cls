public class DeletedChildRecordsAutomatically {
@InvocableMethod
    public static void childrecordsDeleted(list<id> lstid){
     list<Emp__c> childlist = [SELECT id,name FROM Emp__c WHERE Dept__c IN:lstid];
         delete childlist;
    }
}