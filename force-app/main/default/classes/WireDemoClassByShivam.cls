public with sharing class WireDemoClassByShivam {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
      
        List<Contact> conDetails = [SELECT Id, Name FROM Contact];
        return conDetails;
    }
    
}