public class UpdateField {
    public static void accFieldsUpdate(list<account> accList){
        List<account> accList1 = new List<account>();
        for(account acc : accList){
            if(acc.Type == 'Prospect'){
                acc.Industry = 'Agriculture';
                accList1.add(acc);    
            }
        }
        system.debug(accList1);
        update accList1;  
    }
}