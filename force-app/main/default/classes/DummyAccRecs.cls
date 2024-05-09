public class DummyAccRecs {
    public static void dummyRecs(){
        List<account> accList = new List<account>();
        for(integer accRec = 1; accRec <=10; accRec++) {
            account acc = new account();
            acc.ID = acc.Id;
            acc.Name = 'Nagini'+accRec;
            accList.add(acc);
        }
    }
}