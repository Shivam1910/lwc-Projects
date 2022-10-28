public class PracticeWrapperDemo {
    public List<AccountWrapper> newWrapperList{get;set;}
    public List<Account> accountRecrodsList{get;set;}
    
    public PracticeWrapperDemo(){
        newWrapperList = new List<AccountWrapper>();
        accountRecrodsList = new List<Account>();
        fillWrapper();
    }
    
    public void fillWrapper(){
        Integer index = 1;
        for(Account accRec : [SELECT Name,(SELECT Name FROM Contacts) FROM Account]){
            AccountWrapper objWrap = new AccountWrapper();
            objWrap.Sno = index;
            objWrap.name = accRec.Name;
            if(accRec.Contacts.size()>0){
                objWrap.conName = accRec.Contacts[0].Name;
            }
            index++;
            newWrapperList.add(objWrap);
        }
    }
    public class AccountWrapper{
        public Integer Sno{get;set;}
        public String name{get;set;}
        public String conName{get;set;}
    }
}