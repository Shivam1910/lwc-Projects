public class TriggerAssingment2 
{

    public static void accUpdate(List<Account> newList)
    {
        for(Account acc : newList)
        {
            Opportunity op = new Opportunity();
             if(acc.Account_Type__c == null)
             {   //To get data from account id
                op.Stage_Type__c = '0';
            }
            else 
                if(acc.Account_Type__c == 'Reseller')
            {
                op.Stage_Type__c = '10';
            }
            else 
                if(acc.Account_Type__c == 'Buyer')
            {
                op.Stage_Type__c = '25';
            }
            else 
                if(acc.Account_Type__c == 'Current Customer')
            {
                op.Stage_Type__c = '100';
            }
            
        }
    }
}