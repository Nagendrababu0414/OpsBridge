public class AutoUpdateContactStatus {
    public void contactStatusUpdated(List<Contact> lst){
        Set<Id> st = new Set<Id>();
           for(Contact cont : lst){
            If(cont.Email !=Null){
                st.add(cont.AccountId);
                  }
        }
                List<Account> lstl = new List<Account>();
          
    }
}