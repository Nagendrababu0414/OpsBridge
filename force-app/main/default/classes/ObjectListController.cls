public with sharing class ObjectListController {
    public Integer pageSize { get; set; }
    public Integer pageNumber { get; set; }
    public Integer totalRecords { get; set; }
    public List<String> objectNames { get; set; }
    private static final Integer MAX_OBJECTS = 999; // Maximum number of objects to fetch

    public ObjectListController() {
        pageSize = 50;
        pageNumber = 1;
        populateObjectNames();
    }

    // Method to populate a list of all object names accessible to the current user
    private void populateObjectNames() {
        objectNames = new List<String>();
        Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
        Integer count = 0;
        for (String objectName : globalDescribe.keySet()) {
            Schema.SObjectType objectType = globalDescribe.get(objectName);
            if (objectType.getDescribe().isAccessible()) {
                objectNames.add(objectName);
                count++;
            }
            if (count >= MAX_OBJECTS) {
                break; // Stop adding objects once the maximum limit is reached
            }
        }
        totalRecords = objectNames.size();
    }

    // Method to retrieve a subset of objects for pagination
    public List<String> getObjectNames() {
        List<String> paginatedList = new List<String>();
        Integer startIndex = (pageNumber - 1) * pageSize;
        Integer endIndex = Math.min(startIndex + pageSize, totalRecords);
        for (Integer i = startIndex; i < endIndex; i++) {
            paginatedList.add(objectNames[i]);
        }
        return paginatedList;
    }

    // Method to navigate to the previous page
    public PageReference previous() {
        if (pageNumber > 1) {
            pageNumber--;
        }
        return null;
    }

    // Method to navigate to the next page
    public PageReference next() {
        if (pageNumber * pageSize < totalRecords) {
            pageNumber++;
        }
        return null;
    }
}