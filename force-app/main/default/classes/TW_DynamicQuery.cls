Public With Sharing class TW_DynamicQuery {
    public static integer count=0;
    @AuraEnabled
    public static List<sObject> sendData(List<String> tw_fieldList, string tw_clsId, string tw_clsObjectApiName, string tw_relationshipField)
    {
        string queryStr = 'Select ';
        //integer lstSize= tw_fieldList.size();
        for(integer i=0;i<=tw_fieldList.size()-1; i++){
            if(i==0){
                queryStr += tw_fieldList[i];
            }
            else{
                queryStr += ',' + tw_fieldList[i];
            }
        }
        queryStr += ' from ' + tw_clsObjectApiName + ' Where ' + tw_relationshipField + ' = ' + '\'' + tw_clsId + '\'';
        List<sObject> sObjList=Database.query(queryStr);
        //sobjList is source 
        SObjectAccessDecision tw_securityDecision = Security.stripInaccessible(AccessType.READABLE,sObjList,true);
        List<sObject> recordsAfterSecurityCheck = tw_securityDecision.getRecords();
      
        return recordsAfterSecurityCheck;
        }
    
        @AuraEnabled
        public static List<String> sendLabels(List<String> tw_fieldList, string tw_clsObjectApiName)
        {
            wrapperClassToStoreFls check = TW_DynamicQuery.checkFls(tw_fieldList,tw_clsObjectApiName);
            
            List<string> lstReadAccessFields = check.readAccessFields;
            List<String> containLabels = new List<String>();
            SObjectType childSobjectType = Schema.getGlobalDescribe().get(tw_clsObjectApiName);
            Map<String,Schema.SObjectField> mfields = childSobjectType.getDescribe().fields.getMap();
            for(string st:lstReadAccessFields){
            Schema.DescribeFieldResult fieldResult = mfields.get(st).getDescribe();
           
            containLabels.add(fieldResult.getLabel());
            }
            return containLabels;
        }
        @AuraEnabled
        public static wrapperClassToStoreFls checkFls(List<String> tw_fieldList, string tw_clsObjectApiName)
        {
            //creating variables to store the tw_clsObjectApiName
            string queryObjectApiName = tw_clsObjectApiName;
            SObjectType objectReferenceToQuery = schema.getGlobalDescribe().get(queryObjectApiName);
           
            //creating a list to store the tw_fieldList
            List<String> tw_fieldsToQuery = tw_fieldList;
            List<string> tw_fieldsUserhasReadAccess = new List<string>();  //this list contains fields user has access
            List<string> tw_fieldsUserhasnotAccess = new List<string>(); //this list contains fields that user doesn't have access
            List<String> tw_fieldsUserhasEditAccess = new List<String>();
            Schema.DescribeSObjectResult r = objectReferenceToQuery.getDescribe();
            Map<String,Schema.SObjectField> MapofField = r.fields.getMap();
            wrapperClassToStoreFls wrapperInstance;
            for(string str: tw_fieldsToQuery){
                if(MapofField.containsKey(str)){
                    Schema.SObjectField value = MapofField.get(str);
                    Schema.DescribeFieldResult properties = value.getDescribe();
                    //Scehema.SObjectType.isAccessble() methods checks read access
                    if(properties.isAccessible() == true && properties.isCreateable() == true && properties.isUpdateable()){

                        tw_fieldsUserhasEditAccess.add(str);
                        
                    
                    }
                    
                    if(properties.isAccessible()){
                        tw_fieldsUserhasReadAccess.add(str);
                    }
                    else{
                        tw_fieldsUserhasnotAccess.add(str);
                    }
                 }
                 
                wrapperInstance = new wrapperClassToStoreFls(tw_fieldsUserhasnotAccess,tw_fieldsUserhasReadAccess,tw_fieldsUserhasEditAccess);
            }
            
            return wrapperInstance;
             
        }
        public  class wrapperClassToStoreFls{
              @AuraEnabled
              public List<String> noAccessFields;
              @AuraEnabled
              public List<String> readAccessFields;
              @AuraEnabled
              public List<String> editAccessFields;
             public wrapperClassToStoreFls(List<String>noAccessFields,List<String>readAccessFields,List<String>editAccessFields){
                this.noAccessFields = noAccessFields;
                this.readAccessFields = readAccessFields;
                this.editAccessFields = editAccessFields;

             }
        }
}