public class ApexContains {
    string name =  'Antra' ;
    static integer age;
    public static void noPar(){
        string name = 'Techwish';
        system.debug(name  +'is updated');
    }
    public void onePar(string str){
        name = 'Hoger Controls';
        system.debug('Techwish is upgraded as '+name);
    }
    public void noPar1(){
        age = 20;
        system.debug('age is '+ age);
    }
    public static void noPar2(){
        string name = 'CF ';
        system.debug('name is '+ name);
    }
    public static List<string> noPar3(List<string> strList){
        system.debug('Hi');
        for(string str:strList){
            system.debug('00000'+str);
        }
        return strList;
        
    }
    public static void accInsert(){
        account acc = new account();
        acc.name = 'Cfulcrum';
        insert acc;
        system.debug('cfulcrum is inserted successfully');
    }
    public static void accBulkUpdate(){
        List<account> accList = [SELECT id, name FROM account];
        if(!accList.isEmpty()){
            for(account ac : accList){
                ac.Active__c = 'YES';
                //accList.add(ac);
            }
        }
        update accList;
        system.debug('Hi');
        
    }
    public static void accDeletion(){
        List<account> accList = [SELECT id, name from account where Active__c = 'no'];
        delete accList;
        system.debug('Deleted');
    }
    
    
    public static void updateAcc(List<account> accList){
        for(account acc :accList ){
            if(acc.Active__c=='yes' && acc.AnnualRevenue<25000){
                acc.Rating = 'Hot';
            }
        }
        
    }
    public static void createContactForAcc(List<account>accList){
        List<contact> conList = new List<contact>();
        for(account acc:accList){
            contact con = new contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conList.add(con);
        }
        insert  conList;
    }
}