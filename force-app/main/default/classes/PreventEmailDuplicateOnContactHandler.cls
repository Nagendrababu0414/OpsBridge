public class PreventEmailDuplicateOnContactHandler {
    public static void preventDuplicate(List<contact> conList){
        set<string> strPhone = new set<string>();
        List<contact> conList1 = [select id, name, Phone from contact where Phone IN :strPhone];
        for(contact con : conList1){
            strPhone.add(con.Phone);
        }
        for(contact con1 :conList){
            if(strPhone.contains(con1.Phone)){
                con1.phone.addError('duplicates not allowed');
            }
        }
    }
}