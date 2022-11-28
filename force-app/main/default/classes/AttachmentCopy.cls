/*================================================================
* iBirds software pvt. 
* Name: contact
* Description:Trigger on Contact Object
* Created Date: 2 oct 2022
* Created By: Shivam Shrivastava
==================================================================*/
public class AttachmentCopy{
    
    public AttachmentCopy() {
        fillPickList();
        wrapperClassData();
        masterCheckBox = false;
        showCopyButton = false;        
        fillPickList2nd();
        showSecondPage = false;
    }
    // ***************************************** First Wrapper Class 'Variable' *****************************************************
    
    public List<SelectOption> pickList{get;set;}                   //  pickList Declaration
    public List<WrapperClass> wrapperList{get;set;}               //  wrpperClass Declaration
    public Set<String> acoId{get;set;}                           //  Parent Id Declaration
    public String container{get;set;}                           //  SelectList Container Declaration    
    public Boolean showSecondBlock{get;set;}                   //  show Second Page Declaration
    public Boolean showCopyButton{get;set;}                   //   Copy Button show Declaration
    public Boolean masterCheckBox{get;set;}
    public Boolean showPopup{get;set;}
    
    // ***************************************** 2nd Wrapper Class 'Variable' *****************************************************
    
    
    public List<SelectOption> pickList2nd {get;set;}
    public List<PopupWrapperClass> pWrapperList2nd{get;set;}
    
    public String container2{get;set;}
    public Boolean showSecondPage{get;set;}
    public Boolean masterCheckBox2nd{get;set;}

    
    // ***************************************** 1st  CheckBox Method *****************************************************    
    
    public void mastercheckMethod() {
        for(WrapperClass cb : wrapperList) {
            cb.wrapperCheckBox = masterCheckBox;
        }
        showCopyButton = masterCheckBox;
    }
    
    public void wrapperCheckMethod() {
        Integer count = 0;
        for(WrapperClass cb : wrapperList) {
            if(cb.wrapperCheckBox == true) {
                count++;
            }
            
        }
        if(count > 0) {
            showCopyButton = true;
        } else {
            showCopyButton = false;
        }
        
        if(wrapperList.size() == count) {
            masterCheckBox = true;
        }
        else if(wrapperList.size() != count) {
            masterCheckBox = false;
        }
        
    }
    
    
    //***************************************************2nd CheckBox Method *******************************************************    
    
    public void masterCheckBoxMethod2nd() {
        for(PopupWrapperClass mcb2nd : pWrapperList2nd) {
            mcb2nd.wrapperCheckBox2 = masterCheckBox2nd;
        }
    }
    
    public void wrapperCheckBoxMethod2nd() {
        Integer count2 = 0;
        for(PopupWrapperClass mcb2nd : pWrapperList2nd) {
            if(mcb2nd.wrapperCheckBox2 == true ) {
                count2++;
            }
        }
        if(count2 == pWrapperList2nd.size()) {
            masterCheckBox2nd = true;
        }
        else if(count2 != pWrapperList2nd.size()) {
            masterCheckBox2nd = false;
        }
        
    }
    
    // ***************************************** PickList Method *****************************************************
    
    public void fillPickList() {
        
        pickList = new List<SelectOption>();
        pickList.add(new SelectOption ('None','---None---'));
        pickList.add(new SelectOption('Account','Account'));
        pickList.add(new SelectOption('Contact','Contact'));
        pickList.add(new SelectOption('Opportunity','Oppertunity'));
    }
    
    public void fillPickList2nd() {
        
        pickList2nd = new List<SelectOption>();
        pickList2nd.add(new SelectOption('None','---None---'));
        pickList2nd.add(new SelectOption('Account','Account'));
        pickList2nd.add(new SelectOption('Contact','Contact'));
        pickList2nd.add(new SelectOption('Opportunity','Opportunity'));
    }
    
    // ***************************************** 1st WrapperClass Method *****************************************************    
    
    public void wrapperClassData() {
        
        wrapperList = new List<WrapperClass>();         //  Wrapper Class Initailization
        acoId = new Set<String>();                        //  pId Initialization
        
        if(container == 'Account') {
            for(Account acc : [SELECT Id FROM Account]) {
                acoId.add(acc.Id);
            }
            
        }
        else if(container == 'Contact') {
            for(Contact con : [SELECT Id FROM Contact]) {
                acoId.add(con.Id);
            }
        }
        else if(container == 'Opportunity') {
            for(Opportunity opp : [SELECT Id FROM Opportunity]) {
                acoId.add(opp.Id);
            }
        }
        
        
        
        Integer index = 1;
        for(Attachment attach : [SELECT Id, Name, ContentType, Body FROM Attachment WHERE ParentId IN : acoId]) {
            WrapperClass wrapper = new WrapperClass();
            wrapper.sNo = index;
            wrapper.name = attach.Name;
            wrapper.contentType = attach.contentType;
            wrapper.body = attach.body;
            wrapper.attachmentURL = '/servlet/servlet.FileDownload?file='+attach.Id;
            wrapperList.add(wrapper);
            index++;
        }
        
        if(wrapperList.size() > 0) {
            showSecondBlock = true;
        } else {
            showSecondBlock = false;
        }
    }
    
    // ***************************************** 2nd WrapperClass Method *****************************************************
    
    public void popupWrapperClassData() {
        
        pWrapperList2nd = new List<PopupWrapperClass>();
        
        if(container2 == 'Account') {
            Integer index2 = 1;
            String srch = '';
            String name = '%' + srch + '%';
            for(Account aco : [SELECT Id, Name FROM Account  WHERE NAME LIKE : name ]) {
                PopupWrapperClass wrapper2nd = new PopupWrapperClass();
                wrapper2nd.sNo2 = index2;
                wrapper2nd.name2 = aco.Name;
                wrapper2nd.recordId = aco.Id;
                pWrapperList2nd.add(wrapper2nd);
                index2++;
            }
        }
        
        if(container2 == 'Contact') {
            Integer index2 = 1;
            String srch = '';
            String name = '%' + srch + '%';
            for(Contact aco : [SELECT Id, Name FROM Contact WHERE NAME LIKE : name]) {
                PopupWrapperClass wrapper2nd = new PopupWrapperClass();
                wrapper2nd.recordId = aco.Id;
                wrapper2nd.sNo2 = index2;
                wrapper2nd.name2 = aco.Name;
                
                pWrapperList2nd.add(wrapper2nd);
                index2++;
            }
        }
        
        if(container2 == 'Opportunity') {
            Integer index2 = 1;
            String srch = '';
            String name = '%' + srch + '%';
            for(Opportunity aco : [SELECT Id, Name FROM Opportunity WHERE NAME LIKE : name]) {
                PopupWrapperClass wrapper2nd = new PopupWrapperClass();
                
                wrapper2nd.sNo2 = index2;
                wrapper2nd.name2 = aco.Name;
                wrapper2nd.recordId = aco.Id;
                pWrapperList2nd.add(wrapper2nd);
                index2++;
            }
        }
        if(pWrapperList2nd.size() > 0){
            showSecondPage = true;
        } else {
            showSecondPage = false;
        }
        
        
    }
    
    
    // ***************************************** 2nd showPopup Method *****************************************************
    
    public void showPopupMethod() {
        showPopup = true;
    }
    
    public void closepupupMethod() {
        showPopup = false;
    }
    
    
    //*************************************** Copy Assign Button ******************************************************* 
    
    public PageReference saveAttach(){
        List<Attachment> attList = new List<Attachment>();
        for(WrapperClass attach : wrapperList){
            if(attach.wrapperCheckBox == true){
                for(PopupWrapperClass record : pWrapperList2nd){
                    if(record.wrapperCheckBox2 == true){
                        attList.add(new Attachment(Name = attach.Name, ParentId = record.recordId, ContentType = attach.ContentType ,Body = attach.Body));
                    }
                }   
            }
        }
        if(attList.size() > 0){
            insert attList;
        }
        PageReference orderPage = new PageReference('/apex/attachement_copy');
        orderPage.setRedirect(true);
        return orderPage;
    }
    
    
    
    // ***************************************** 1st Wrapper Class *****************************************************    
    
    
    public class WrapperClass {
        
        public Integer sNo{get;set;}
        public String name{get;set;}
        public String contentType{get;set;}
        public blob preview{get;set;}
        public Boolean wrapperCheckBox{get;set;}
        public String attachmentURL{get;set;}
        public Blob body;
        // ***************************************** 2nd Wrapper Class *****************************************************
    }
    
    public class PopupWrapperClass {
        
        public Integer sNo2{get;set;}
        public String name2{get;set;}
        public Id recordId;
        public Boolean wrapperCheckBox2{get;set;}
    }
}