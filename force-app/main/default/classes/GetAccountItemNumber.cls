public with sharing class GetAccountItemNumber {
@AuraEnabled
public static List<account> accItemNumber(string accName, string accPhone, string accIndustry){
    try {
    
       List<account> accList =[SELECT id , name, Phone, Website, Industry FROM Account 
                                where Name LIKE : ('%'+accName+'%') or Phone LIKE : ('%'+accPhone+'%') 
                                 or Industry LIKE : ('%'+accIndustry+'%')];
       return accList;
    } 
    catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }   
}
}