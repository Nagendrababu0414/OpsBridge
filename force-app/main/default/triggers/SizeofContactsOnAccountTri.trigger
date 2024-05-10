trigger SizeofContactsOnAccountTri on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter){
SizeofContactsOnAccount.conSize(trigger.new);
    }
        
}