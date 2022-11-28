public with sharing class AccountAccordian {
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccountRecords(){
        return [SELECT Id, Name, Industry, (SELECT Id, FirstName, LastName FROM Contacts) 
                FROM Account];
    }
}