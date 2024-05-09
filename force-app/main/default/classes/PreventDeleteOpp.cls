public class PreventDeleteOpp {
    public static void preventOpp(List<contact> oppList){
       set<ID> oppSet = new set<ID>();
        for(contact opp : oppList){
            if(opp.Id != null){
                oppSet.add(opp.Id);
            } 
        }
                    List<contact> oppL = [SELECT id , name, email from contact WHERE id IN : oppSet and email = ''];
        for(contact opp1 :  oppL){
            if(opp1.email != ''){
            opp1.addError('this record not be deleted');
                }
                          }
        }
    }