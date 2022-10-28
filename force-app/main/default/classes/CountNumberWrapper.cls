/* 
Author: shivam Shrivastava
Date : 20-Sep-2022
Description:  In this controller we are Displaying Account and contact data ussing wrapper class without sub query.
*/
public class CountNumberWrapper {
    public List<AccountWrapper> newWrapperList{get;set;}
    public List<Account> accountRecrodsList{get;set;}

    
    public CountNumberWrapper(){
        newWrapperList = new List<AccountWrapper>();
        accountRecrodsList = new List<Account>();
        fillWrapper();
    }
    
    public void fillWrapper(){
        Integer index = 1;
        for(Account accRec : [SELECT Name,(SELECT Name FROM Contacts) FROM Account]){//for each loop.
            AccountWrapper objWrap = new AccountWrapper(); //initialize memory AccountWrapper.
            objWrap.Sno = index;
            objWrap.name = accRec.Name;
            if(accRec.Contacts.size()>0){
                objWrap.conName = accRec.Contacts[0].Name;
            }
            objWrap.countRec = accRec.Contacts.size();
            newWrapperList.add(objWrap);
            index++;
        }
    }
    public class AccountWrapper{
        public Integer Sno{get;set;}
        public String name{get;set;}
        public String conName{get;set;}
        public Integer countRec{get;set;}
    }
}