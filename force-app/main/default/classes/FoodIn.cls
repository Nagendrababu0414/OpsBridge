public class FoodIn{
    @auraEnabled
    public static Map<string,Object> showFood(){
        Http https =  new Http();
        HttpRequest hreq = new HttpRequest();
        hreq.setEndpoint('https://api.spoonacular.com/recipes/complexSearch?apiKey=ab686a2d132642b1ac07e46d90825490');
        hreq.setMethod('GET');
        HttpResponse hres =https.send(hreq);
        integer reps =hres.getStatusCode();
        if(reps==200){
            Map<string,Object> mso=(Map<string,Object>)JSON.deserializeUntyped(hres.getBody());
            return mso;
        }
          else
              return null;
    }
}