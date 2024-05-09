trigger ChangeOwner on Account (after update) {
UniqUser.accUser(trigger.newMap);
}