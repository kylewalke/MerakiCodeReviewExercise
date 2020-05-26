public class CodeReviewPrompt {
  public CodeReviewPrompt()
  {
  }

// public void methodCall0(SObjectUnitofWork uow){
//     Trigger_Dispatcher.allowOwnerChange = true;
//     Trigger_Dispatcher.runOnUpdate = true;
//         uow.commitWork();
//     Trigger_Dispatcher.allowOwnerChange = false;
//     Trigger_Dispatcher.runOnUpdate = false;
// }

  public void processCases(List <Case> unprocessedCases)
  {
    List <Case> caseList = new List <Case>();

    for (Case c: unprocessedCases)
    {
      assign_Caseowner(c.Id);
      caseList.add(c);
    }
    update caseList;

    Task[] taskList = new Task[] {};
    for (Task t:[SELECT Id, CaseId FROM Tasks WHERE CaseId IN: caseList])
    {
      for (Case c: caseList)
      {
        assign_Caseowner(c.Id);
        caseList.add(c);
      }
    }
  }

  private Case assign_Caseowner(Id caseId)
  {
    Case c = [SELECT Id, Status__c FROM Case WHERE Id =: caseId LIMIT 1];

    if (c <> null)
    {
      c.OwnerId = [SELECT Id FROM User WHERE Name =:'Johnny John'][0].Id;
    }
    return(c);
  }

  static private void taskUpdate(Map <Id, > eMessagesWthCsIds)
  {
  }
}
