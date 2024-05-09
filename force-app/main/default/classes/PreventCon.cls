public class PreventCon {
    public static void deletCon(List<contact> oppList){
   
        //List<contact> oppL = [SELECT id , name, email from contact WHERE id IN : oppSet and email = ''];
        for(contact opp1 :  oppList){
            if(opp1.email != ''){
                opp1.addError('this record not be deleted');
            }
        }
    }
}