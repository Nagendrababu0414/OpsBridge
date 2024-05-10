public class InvokeInterface implements InInterface{
    public void interfaceIn(){
                system.debug('InvokeInterface');

        list<account> lstAcc = new list<account>();
        for(integer i=0; i<2;i++){
            account acc = new account();
            acc.Name = 'Sudha'+i;
            lstAcc.add(acc);
        }
        insert lstAcc;
    }
}