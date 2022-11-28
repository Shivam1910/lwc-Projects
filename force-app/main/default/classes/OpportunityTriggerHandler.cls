/*================================================================
* iBirds software pvt. 
* Name: OpportunityTriggerHandler
* Description:Create a trigger on Opportunity Standard Object
* Created Date: 2 oct 2022
* Created By: Shivam Shrivastava
==================================================================*/
public class OpportunityTriggerHandler {
    
    public static void oppMethod(List<Opportunity> newList){
        
        Set<Id> accountId = new Set<Id>();
        for(Opportunity opp : newList){
            accountId.add(opp.AccountId);
        }
        
        Map<Id, Account> nmap = new Map<Id, Account>([SELECT Id, Account_Type__c FROM Account WHERE Id IN : accountId]);
        for(Opportunity op : newList){
            if(nmap.containskey(op.accountid)){
                if(nmap.get(op.AccountId).Account_Type__c == null){
                    op.Stage_Type__c = '0';
                }
                else if(nmap.get(op.AccountId).Account_Type__c == 'Reseller'){
                    op.Stage_Type__c = '10';
                }
                else if(nmap.get(op.AccountId).Account_Type__c == 'Buyer'){
                    op.Stage_Type__c = '25';
                }
                else if(nmap.get(op.AccountId).Account_Type__c == 'Current Customer'){
                    op.Stage_Type__c = '100';
                }
            }
            
        }
        
    }
}