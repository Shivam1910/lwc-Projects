public with sharing class ShowUserComponent {
    @AuraEnabled(cacheable=true)
      public static List<User> getUserRec(){
       return[SELECT Id, Name, FullPhotoUrl, Email FROM User ];
    }
 
}