public with sharing class DiscountOnAmount {
    public static void discountOnOppAmount(list<opportunity> oppList) {
     for(opportunity opp : oppList){
        if(opp.Amount > 10000){
            opp.Amount *=0.9;
        }
     }
    }
}