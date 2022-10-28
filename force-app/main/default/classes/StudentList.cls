public class StudentList {
    public Student__c studentName{get;set;}
    public List<Student__c> studentData{get;set;}  
    
    public StudentList()
    {
        studentData = new List<Student__c>();
        studentData = [Select Name, Gender__c, Email_Id__c, Date_And_Time__c FROM Student__c ];
    }
    public void addRow(){
        
        studentData.add(studentName = new Student__c());
    }
    public void deleteRow(){
        studentData.remove(studentData.size()-1);
    }   
    
    public void saveRow(){
        UPSERT StudentData;
        studentData.add(new Student__c());
    }   
}