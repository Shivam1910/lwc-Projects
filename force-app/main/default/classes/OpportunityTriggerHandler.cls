//assingment -1 in trigger

public class OpportunityTriggerHandler {
    public static void opportunityInsert(List<Opportunity> newList){//acc
        
          Set<Id> accId = new Set<Id>();
          for(Opportunity op: newList){
            accId.add(op.AccountId);
        }
        
        Map<Id, Account> nmap = new Map<Id, Account>([SELECT Id, Account_Type__c FROM Account where Id in : accId]);
   
        for(Opportunity op : newList){
            if(nmap.get(op.AccountId).Account_Type__c == null){   //To get data from account id
                op.Stage_Type__c = '0';
            }else if(nmap.get(op.AccountId).Account_Type__c == 'Reseller'){
                op.Stage_Type__c = '10';
            }else if(nmap.get(op.AccountId).Account_Type__c == 'Buyer'){
                op.Stage_Type__c = '25';
            }else if(nmap.get(op.AccountId).Account_Type__c == 'Current Customer'){
                op.Stage_Type__c = '100';
            }
        }
    }
}