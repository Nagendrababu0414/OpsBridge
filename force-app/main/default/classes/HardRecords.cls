public class HardRecords {
    public static void hardInsertion(){
        List<account> empList = new LIst<account>();
            account emp  =  new account();
            emp.Name = 'Jagendra';
            //emp.Dept_Type__c = 'HR';
            empList.add(emp);
                                system.debug('succeed');

        insert empList;

    }
}