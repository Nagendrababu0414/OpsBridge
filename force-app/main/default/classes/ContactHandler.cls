public class ContactHandler {
    public static void handleDuplicateContactsByEmail(List<Contact> newContacts) {
        Set<String> emailSet = new Set<String>();

        for (Contact con : newContacts) {
            if (con.Email != null) {
                emailSet.add(con.Email);
            }
        }

        List<Contact> existingContacts = [SELECT Email FROM Contact WHERE Email IN :emailSet];

        if (!existingContacts.isEmpty()) {
            Map<String, Contact> emailToContactMap = new Map<String, Contact>();
            for (Contact con : existingContacts) {
                emailToContactMap.put(con.Email, con);
            }

            for (Contact con : newContacts) {
                if (emailToContactMap.containsKey(con.Email)) {
                    Contact existingContact = emailToContactMap.get(con.Email);
                    con.Email.addError('A contact with this email already exists: ' + existingContact.Id);
                }
            }
        }
    }
}