public class UploadAttach {

    public Attachment attachment{get;set;}
    public Id atId{get;set;}
    public UploadAttach(){
       
        attachment = new Attachment();
         atId = ApexPages.currentPage().getParameters().get('atId');
        attachment.ParentId = atId;
    }
    
    public pageReference upload(){
        insert attachment;
        PageReference pg = new PageReference('/apex/attachement_page');  //partialURL
        pg.setRedirect(true);
       return pg;
    }
}