public class SpoonacularCalloutClass {
    @AuraEnabled
    public static Map<string , Object> getDataFromSpoonacular(Integer num){
       Http htp = new Http();
        HttpRequest hr = new HttpRequest();
        hr.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=ab686a2d132642b1ac07e46d90825490&number='+ num);
        hr.setMethod('GET');
        
        HttpResponse htr= htp.send(hr);
        
        Integer a = htr.getStatusCode();
        if(a== 200){
            Map<string , Object> mpObj = ( Map<string , Object>)JSON.deserializeUntyped(htr.getBody());
           
            return mpObj;
            
        }else {
            return null;
        }
    }
}