public with sharing class EventSelector {
    @testvisible
       private static EventSelector instance;
        public static EventSelector getInstance(){
            if(instance == null){
                instance = new EventSelector();
            }
            return instance;
            }
        
    //Class Name : EventApexController
         
        public  list<Event> getevent(String evid){
         if(!Event.SObjectType.getDescribe().isAccessible()){
            return null;
          }
          else{
            return [SELECT Id, AccountId FROM Event WHERE Id = :evid WITH SECURITY_ENFORCED];   // Method:fetchEventUrl
          }
        }
          
         public list<Event> eventList(String eventId){ 
          if(!Event.SObjectType.getDescribe().isAccessible()){
            return null;
          } 
          else{
            return [Select Id, AccountId from Event];        //Method: updateDentistHygienist
           } 
        }
      }