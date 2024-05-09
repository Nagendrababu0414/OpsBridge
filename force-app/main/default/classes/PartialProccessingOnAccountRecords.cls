public class PartialProccessingOnAccountRecords {
    public static void partialProcess(){
        List<account> accList = new List<account>();
        for(integer rec = 1; rec <= 50; rec++){
            account acc = new account();
            acc.Id = acc.Id;
            acc.Name = 'Nagendra babu'+rec;
            if(rec == 45){
                acc.Name = null;
            }
            accList.add(acc);
        }
        //insert accList;
        system.debug('Inserted directly--'+ accList);
        Database.SaveResult[] rlts = Database.insert(accList, false);
        for(Database.SaveResult rlt: rlts){
            if(rlt.isSuccess()){
                system.debug('Inserted maximum record---'+rlt.getID());
            }
            else{
                for(Database.Error ders : rlt.getErrors()){
                    system.debug('45th record name field in missing');
                                 system.debug('Missing_Required_Field---'+ders.getMessage());
                                 system.debug('The status of the record is----'+ders.getStatusCode());
                                 system.debug('The status of the record is----' +ders.getFields());
                                 }
                                 }
                                 }
                                 }
                                 }