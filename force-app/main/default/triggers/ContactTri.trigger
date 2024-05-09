trigger ContactTri on Contact(before delete){
    if(trigger.isBefore && trigger.isDelete){
        PreventCon.deletCon(trigger.old);
    }
}