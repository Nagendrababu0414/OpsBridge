public class PriceDiscount {
    public  void discountOnBook(List<Opportunity> oppo){
        for(Opportunity opp : oppo){
            if(opp.Amount > 10000){
            opp.Amount *=0.9;
        }
    }
}
}