public class TW_GetRelationshipApiName {
    @auraEnabled(cacheable=true)
    public static string methodTogetChildRelationShip(string tw_contextSobjectName,string tw_childObject){
        SObjectType tw_sojectTypeOfchildObject = Schema.getGlobalDescribe().get(tw_childObject);
         SObjectType tw_sojectTypeOfInput = Schema.getGlobalDescribe().get(tw_contextSobjectName);
         Schema.DescribeSObjectResult tw_propertiesOfSobject = tw_sojectTypeOfInput.getDescribe();
         List<Schema.ChildRelationship> tw_childRelationships = tw_propertiesOfSobject.getChildRelationships();
         string tw_output = '';
        for(Schema.ChildRelationship cr:tw_childRelationships){
            if(cr.childsobject == tw_sojectTypeOfchildObject){
                 tw_output = cr.getRelationshipName();
            }
        }
        return tw_output;
    }
    //Description: getPluralNameofsObject method returns the Plural Name.
    @auraEnabled(cacheable=true)
    public static String getPluralNameofsObject(string tw_childObject){
        SObjectType typeofsObject = Schema.getGlobalDescribe().get(tw_childObject);
       
        Schema.DescribeSObjectResult descriptionOfSobject = typeofsObject.getDescribe();
        string tw_pluralNameofSobject = descriptionOfSobject.getLabelPlural();
        return tw_pluralNameofSobject;
    }

    @auraEnabled(cacheable=true)
    public static string sendObjectLabelForDeleteModal(string tw_childObject)
    {
        SObjectType testLabel = Schema.getGlobalDescribe().get(tw_childObject);
        Schema.DescribeSObjectResult describe = testLabel.getDescribe();
        return describe.getLabel();
    }
}