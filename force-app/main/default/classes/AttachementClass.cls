public class AttachementClass {
    List<Contact> contactRecords = [SELECT Id, Name, Phone, LeadSource, Email,(Select id from Attachments) FROM Contact];
    public List<WrapperContact> contactList{get;set;}
    public String attId{get;set;}
    
    public AttachementClass() {
        contactList = new List<WrapperContact>();
        fillRecords();
    }
    public void fillRecords() {    
        Integer index = 1;
        for(Contact contactRecord : contactRecords) {
            WrapperContact wrapper = new WrapperContact();
            wrapper.Id = contactRecord.id;
            wrapper.sNo = index;
            wrapper.Name = contactRecord.Name;
            wrapper.Phone = contactRecord.Phone;
            wrapper.Email = contactRecord.Email;
            wrapper.LeadSource = contactRecord.LeadSource;   
            if(contactRecord.Attachments != Null && contactRecord.Attachments.size() > 0){
                wrapper.atId= contactRecord.Attachments[0].id; 
            }
            index++;
            contactList.add(wrapper);
        }
        
    }
    
    public PageReference deleteRecord(){
        DELETE [SELECT Id FROM Attachment WHERE Id =: attId];
        PageReference pg = new PageReference('/apex/attachement_page');  
        pg.setRedirect(true);
        return pg;
    }
    public class WrapperContact {
        public String Id{get;set;}
        public Integer sNo{get;set;}
        public String Name{get;set;}
        public String Phone{get;set;}
        public String LeadSource{get;set;}
        public String Email{get;set;}
        public String atId{get;set;}
        
    }
}