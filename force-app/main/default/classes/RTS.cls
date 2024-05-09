global class RTS implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Email,RTS_Count__c FROM Contact WHERE RTS_Count__c = 1 and Email !=null';
        return Database.getQueryLocator(query);
    }
    global String body='';
    global List<Contact> ContactList = new List<Contact>();
   global void execute(Database.BatchableContext BC, List<Contact> scope) {
     for(Contact a : scope)
     {
         ContactList.add(a);
     }

    List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage mail1=new Messaging.SingleEmailMessage();
  

    for(Contact a:ContactList){
        String[] toadd=new String[]{a.Email};
        string b =  'hello' ; 
        body += b ;
        mail1.setToAddresses(toadd);
        mail1.setSubject('Test mail');
        mail1.setPlainTextBody('this is a test mail');
        mail1.setHtmlBody(body);
        lstEmail.add(mail1);
    }
    System.debug(body);
       Messaging.SendEmail(lstEmail);
}  

    global void finish(Database.BatchableContext BC) {
    
    }
}