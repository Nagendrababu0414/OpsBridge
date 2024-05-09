public class ContactObj implements InInterface{
    public void interfaceIn(){
                        system.debug('ContactObj');

        list<contact> lstAcc = new list<contact>();
        for(integer i=0; i<2;i++){
            contact acc = new contact();
            acc.email = 'Sudha@gma'+i+'@gmail.com';
            lstAcc.add(acc);
        }
        insert lstAcc;
    }
}