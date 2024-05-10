public class MyMain implements InInterface { 
    public void interfaceIn(){
        InvokeInterface int2= new InvokeInterface();
        ContactObj int1 = new ContactObj();
        system.debug('Interface');
        
    }
    public static void mainMt(){
        MyMain mm = new MyMain();
        mm.interfaceIn();
        system.debug('method passed');
    }
}