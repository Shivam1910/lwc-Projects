public with sharing class ContactSelectCityPicklistController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> contactRecords(){
        return [SELECT Id, Name, Email, City__c From Contact Where City__c != null];
     }
 }