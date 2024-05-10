@RestResource(UrlMapping = '/AccData/*')
global class CallInForRJ {
    @HttpGet
    global static List<Account> sendAccData(){
        List<Account> acc= [select id, Name ,Rating ,Industry From Account];
        return acc;
    }
}