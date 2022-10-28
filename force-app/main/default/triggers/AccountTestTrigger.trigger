trigger AccountTestTrigger on Account (after delete) 
{
   if(trigger.isafter && trigger.isdelete)
       
   {
       for(Account acc : trigger.old)
           
       {
           if(acc.Active__c == null)
           {
               acc.AddError('Cannot Delete Active Record');
           }
       }
   }
}