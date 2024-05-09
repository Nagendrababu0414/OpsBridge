public class EmailManager {
    public static void SendEmailTemplateWithoutTemplate(string email) {

        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        List<String> address = new List<String>{email};
            
       	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Email sent by Nagendra');
        mail.setplaintextbody('Welcome to Cloudfulcrum');
        mail.setToAddresses(address);
        emailList.add(mail);
        
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }	   
    }
}