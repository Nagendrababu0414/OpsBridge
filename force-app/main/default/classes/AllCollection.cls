public class AllCollection {
    public static void addMethod(){
        List<string> strList = new List<string>();
        strList.add('Nagendra');
        strList.add('Sudha');
        system.debug(strList[1]+''+'Dharanikota'+strList);
    }
    public static void addAll(){
        List<string > strList = new List<string>{'Nagendra', 'Sudha', 'Hanwi'};
            List<string > strList1 = new List<string>{'Dharanikota'};
                strList1.addAll(strList);
        system.debug(strList1);
        strList1.add(strList[1]);
        system.debug(strList1);
        
    }
    public static void clear(){
        List<string> strList = new List<string>{'cloudfulcrum', 'Antra', 'Vertex'};
            strList.clear();
        system.debug(strList);
    }
    public static void clone(){
        List<string> strList = new List<string>{'Nagendra', 'Sudha', 'Dharanikota'};
            strList.clone();
        system.debug(strList);
    }
    public static void contains(){
        List<string> strList= new List<string>{'NRT', 'HYd', 'CPL'};
            if(strList.contains(strList[2])){
        system.debug(strList[0]);
            } 
    }
    public static void get(){
        List<string> strList = new List<string>{'Bhiryani', 'Fry', 'Chicken'};
            system.debug(strList.get(0));
    }
}