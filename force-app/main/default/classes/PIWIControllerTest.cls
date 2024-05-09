@isTest
private class PIWIControllerTest {
   @isTest
    static void testGetPendingpws() {
     
        ProcessInstance testProcessInstance = new ProcessInstance();

        // Call the getPendingpws method with the test data
        Test.startTest();
        List<PIWIController.wrapper> result = PIWIController.getPendingpws();
        Test.stopTest();

    }
    @isTest
    static void testRecordsApproval() {
       
        List<ProcessInstance> piList = new List<ProcessInstance>();
         ProcessInstance piTest = new ProcessInstance();
        piTest.Status = 'Pending';
        piTest.TargetObjectId = Null;
        piTest.SubmittedById= Null;
        piList.add(piTest);
        
        List<PIWIController.wrapper> pcList = new List<PIWIController.wrapper>();
         PIWIController.wrapper myWrapper = new PIWIController.wrapper();
            myWrapper.idi = 'piTest.id';
            myWrapper.name = 'piTest.id';
            myWrapper.status = 'piTest.Status ';
            myWrapper.submittedby = ' piTest.SubmittedById';
            pcList.add(myWrapper);

         /*  PIWIController.wrapper myWrapper1 = new PIWIController.wrapper();
            myWrapper1.idi =Null;
            myWrapper1.name = '';
            myWrapper1.status = 'pending';
            myWrapper1.submittedby = 'Test User';
            pcList.add(myWrapper1);
        */
        System.runAs(new User(Id = UserInfo.getUserId())) {
            PIWIController.recordsApproval(new List<PIWIController.wrapper>());
            List<PIWIController.wrapper> result = PIWIController.getPendingpws();
            System.assertEquals(0, result.size(), 'No pending records should be present in this test scenario');
            
       }
    }
    
    @isTest
    static void testRecordsReject() {
    
        System.runAs(new User(Id = UserInfo.getUserId())) {
            PIWIController.recordsReject(new List<PIWIController.wrapper>());
            PIWIController.wrapper myWrapper = new PIWIController.wrapper();
            myWrapper.idi = Null;
            myWrapper.name = 'Test Name';
            myWrapper.status = 'Test Status';
            myWrapper.submittedby = 'Test User';
        }
    }
            @isTest
    static void testRecordsApprovals() {
        // Create a test user
        User testUser = new User(
            FirstName = 'Test',
            LastName = 'User',
            Email = 'testuser@example.com',
            Alias = 'tuser',
            Username = 'testuser0761@example.com',
            CommunityNickname = 'testuser',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id
        );
        insert testUser;
        
        ProcessInstance testProcessInstance = new ProcessInstance();
           
          /*  testProcessInstance.Status = 'Pending';
            testProcessInstance.SubmittedBy = testUser;
            testProcessInstance.ProcessDefinitionId = testUser.Id;
            testProcessInstance.TargetObjectId = testUser.Id;
            testProcessInstance.SubmittedById = testUser.Id;
            insert testProcessInstance;*/
           
        ProcessInstanceWorkitem testWorkItem = new ProcessInstanceWorkitem();
           /* ProcessInstanceId = testProcessInstance.Id,
            OriginalActorId = testUser.Id,
            ActorId = testUser.Id);
            insert testWorkItem;*/
        
        Test.startTest();
        PIWIController.wrapper testWrapper = new PIWIController.wrapper();
        testWrapper.idi = testProcessInstance.Id;
        List<PIWIController.wrapper> testList = new List<PIWIController.wrapper>{testWrapper};
        PIWIController.recordsApproval(testList);
        Test.stopTest();

        
    } 
}