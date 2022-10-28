public class AttachmentCopy {
    public String selectedObjectName{get;set;}
    public Boolean showAttachmentTable{get;set;}
    public Boolean AllCheck{get;set;}  
    public boolean displayPopup {get; set;}
    
    public List<AttachmentWrapper> attachmentRecords{get;set;}
    public AttachmentCopy(){
        showAttachmentTable = false;
        AllCheck = false;
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.warning,'Please select any object which you perform');
        ApexPages.addMessage(myMsg);
    }
    public List<SelectOption> getObjects(){
        List<SelectOption> objectNameOptions = new List<SelectOption>();
        objectNameOptions.add(new SelectOption('', '--None--'));
        objectNameOptions.add(new SelectOption('Account', 'Account'));
        objectNameOptions.add(new SelectOption('Contact', 'Contact'));
        objectNameOptions.add(new SelectOption('Opportunity', 'Opportunity'));
        return objectNameOptions;
    }
    //------------------------------ Get Record----------------------------------------
    public void fillAttachmentWrapper(){
        attachmentRecords = new List<AttachmentWrapper>();
        Set<Id> parentId = new Set<Id>();
        if(selectedObjectName == 'Account'){
            for(Account accountRecord : [SELECT Id FROM Account]){
                parentId.add(accountRecord.id);
            }
        }
        else if(selectedObjectName == 'Contact'){
            for(Contact contactRecord : [SELECT Id FROM Contact]){
                parentId.add(contactRecord.id);
            }
        }
        else if(selectedObjectName == 'Opportunity'){
            for(Opportunity opportunityRecord : [SELECT Id FROM Opportunity]){
                parentId.add(opportunityRecord.id);
            }
        }
        if(parentId.size() > 0){
            Integer index = 1;
            for(Attachment attachmentRecord : [SELECT Id, Name, ContentType FROM Attachment WHERE ParentId IN : parentId]){
                AttachmentWrapper attachmentWrapperObj = new AttachmentWrapper();
                attachmentWrapperObj.sNo = index;
                attachmentWrapperObj.name = attachmentRecord.Name;
                attachmentWrapperObj.contentType = attachmentRecord.ContentType;
                attachmentWrapperObj.attachmentUrl = '/servlet/servlet.FileDownload?file='+attachmentRecord.Id;
                attachmentRecords.add(attachmentWrapperObj);
                index++;
            }
        }
        if(attachmentRecords.size() > 0){
            showAttachmentTable = true;
        }else{
            showAttachmentTable = false;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.error,'Attachment not available in "'+selectedObjectName+'" object...!');
            ApexPages.addMessage(myMsg);
        }
    }
    
    //-----------------------------------check box------------------------------------------------------------------
    public void allCheck(){
        for(AttachmentWrapper atwrapper : attachmentRecords){
            if(AllCheck == true){
                atwrapper.isSelected = true;
            }
            else{
                 atwrapper.isSelected = false;
            }
        }
    }
    //------------------------------------single check box--------------------------------------------------------------
    public void singleCheckMethod(){
        Integer count = 0;
        for(AttachmentWrapper atwrapper : attachmentRecords){
            if(atwrapper.isSelected == true){
                
                count++;
            }
            else{
                AllCheck = false;
            }
            
            if(attachmentRecords.size() == count){
                 AllCheck = true;
            }
            else{
                AllCheck = false;
            }
            
        }
    }
    
    
       public void closePopup() {
        displayPopup = false;
    }
 
    public void showPopup() {
        displayPopup = true;
    }
   // -----------------------------wrapper class---------------------------------------------
    
    public class AttachmentWrapper{
        public Integer sNo{get;set;}
        public String name{get;set;}
        public String contentType{get;set;}
        public String attachmentUrl{get;set;}
        public Boolean isSelected{get;set;}
 
    }
}