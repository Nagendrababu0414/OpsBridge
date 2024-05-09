trigger PreventDuplicateContactByEmail on Contact (before insert, before update) {
    ContactHandler.handleDuplicateContactsByEmail(Trigger.new);
}