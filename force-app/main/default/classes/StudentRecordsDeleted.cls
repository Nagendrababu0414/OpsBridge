public class StudentRecordsDeleted {
@InvocableMethod
    public static void childrecordsDeleted(list<id> lstid){
     list<Student__c> childlist = [SELECT id,name FROM Student__c WHERE Teacher__r.ID In:lstid];
        for(Student__c stu: childlist){
       
        }
         delete childlist;
    }

}