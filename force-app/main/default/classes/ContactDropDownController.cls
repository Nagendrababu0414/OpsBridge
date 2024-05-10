public class ContactDropDownController {
    @auraEnabled
    public static list<contact> contactDropDown(){
        List<contact> conList =[select id, LastName from contact];
        return conList;
       
    }
    @auraEnabled
    public static list<contact> contactDropDown1(string nm){
        List<contact> conList =[select id, LastName from contact where LastName =: nm ];
        return conList;
       
    }
}