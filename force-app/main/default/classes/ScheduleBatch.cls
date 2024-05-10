global class ScheduleBatch implements Schedulable

{
    
    global void execute(SchedulableContext sc)
        
    {
        
        RTS rt = new RTS(); 
        
        database.executeBatch(rt);
        
    }
    
}