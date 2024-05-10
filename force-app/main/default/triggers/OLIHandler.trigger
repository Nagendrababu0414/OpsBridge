trigger OLIHandler on OpportunityLineItem (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        CountofOpportunityLineItem.countofOLI(trigger.new);
    }
}