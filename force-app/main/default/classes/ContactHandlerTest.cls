@isTest
public class ContactHandlerTest {
    @isTest
    static void testDuplicateContactsByEmail() {
        Contact existingContact = new Contact(FirstName = 'RO', LastName = 'CF', Email = 'sample@gmail.com');
        insert existingContact;

        Contact newContact = new Contact(FirstName = 'cf', LastName = 'ro', Email = 'sample@gmail.com');
        Contact anotherNewContact = new Contact(FirstName = 'rocf', LastName = 'cfro', Email = 'alice@example.com');

        // Add the new contacts to a list
        List<Contact> newContacts = new List<Contact>();
        newContacts.add(newContact);
        newContacts.add(anotherNewContact);

        Test.startTest();
        
        ContactHandler.handleDuplicateContactsByEmail(newContacts);

        Test.stopTest();
    }
}