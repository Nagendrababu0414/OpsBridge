public class ContactShar {
    public static void shareContact(){
        contact con = [select id, LastName, Phone From contact where id = '0035j00000NNA4eAAH'];
        ContactShare shareCon = new ContactShare();
    }
}