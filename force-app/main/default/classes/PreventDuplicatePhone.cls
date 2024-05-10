public with sharing class PreventDuplicatePhone {
    public static void PreventPhoneOnContactHandlerMethod(List<contact> lstCons) {
    set<string> setPhones = new Set<String>();
    set<string> oldPhoneNumbers = new set<string>();
    set<string> setMobile = new set<string>();
    Set<String> oldMobileSet = new Set<String>();
        for(contact con : lstCons){
    if(con.Phone != null)  {
        setPhones.add(con.Phone);
        setPhones.add(con.MobilePhone);
    }  
    }
    List<contact> lstContactPhones = [SELEct id, name, phone, MobilePhone from Contact where Phone IN: setPhones ];
    for(contact cont :lstContactPhones){
        if(cont.phone!=null){
            oldPhoneNumbers.add(cont.phone);
        }
        if(cont.MobilePhone!=null){
            oldMobileSet.add(cont.MobilePhone);
        }
    }
    for(contact con:lstCons){
        if(oldPhoneNumbers.contains(con.Phone)){
                  con.phone.addError('Number alreay exist');
                  if(oldMobileSet.contains(con.MobilePhone)){
                      con.MobilePhone.addError('Sorry, Mobile already existed');
                  }
        }
    }
 }
}