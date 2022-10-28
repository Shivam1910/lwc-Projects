/* 
Author: shivam Shrivastava
Date : 21-Sep-2022
Description:  In this controller we are Displaying Account data using wrapper class without sub query.
*/
public class MapTable {
public List<AccountWrapper> wrapperRecords{get;set;}
public MapTable(){//constructor
wrapperRecords = new list<AccountWrapper>(); 
conCounting ();//method
}
public void conCounting(){
Map<Id,Integer> mapRecord = new Map<Id,Integer>();
Integer conCount=0;
For(Contact con : [Select Id, AccountId From Contact]){
    conCount = mapRecord.get(con.AccountId);
    If(conCount == null){
        conCount = 0;            
    }
    conCount++;
    mapRecord.put(con.AccountId,conCount);//key,value
}

Integer index = 1;
for(Account accRec : [SELECT Name FROM Account]){
    AccountWrapper objWrap = new AccountWrapper(); //initialize memory AccountWrapper.
    objWrap.Sno = index;
    objWrap.name = accRec.Name; 
    objWrap.countRec =mapRecord.get(accRec.Id);
    wrapperRecords.add(objWrap);
    System.debug(wrapperRecords);
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