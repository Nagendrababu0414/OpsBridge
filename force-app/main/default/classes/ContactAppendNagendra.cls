public class ContactAppendNagendra {
    public void contactAppendAdd(List<Contact> Lst){
        for(Contact cn : Lst){
        //Contact con = new Contact();
        cn.Email = 'Nagendra_' + cn.Email;
        }
    }
}