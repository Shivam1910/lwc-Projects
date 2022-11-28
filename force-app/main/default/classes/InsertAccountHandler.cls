public with sharing class InsertAccountHandler {

    @AuraEnabled
    public static Account accountRecMethod(Account accRec){
        try {
            
            insert accRec;
            return accRec;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

       
    }
}