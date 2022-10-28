public class AccountHandlerAssignment2 {

    public static void accountUpdate(List<Account> newList){
        for(Account acc: newList){
            Opportunity opp = new Opportunity();
            
            if(acc.Account_Type__c == null){
                opp.Stage_Type__c = '0';
            }
            else
                if(acc.Account_Type__c == 'Reseller'){
                    opp.Stage_Type__c = '10';
                }
            else
                if(acc.Account_Type__c == 'Buyer'){
                    opp.Stage_Type__c = '25';
                }
            else
                if(acc.Account_Type__c == 'Current Customer'){
                    opp.Stage_Type__c = '100';
                }
            
        }
    }
}