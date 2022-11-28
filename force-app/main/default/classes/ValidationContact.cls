/*================================================================
* iBirds software pvt. 
* Name: contact
* Description:Trigger on Contact Object
* Created Date: 2 oct 2022
* Created By: Shivam Shrivastava
==================================================================*/
public class ValidationContact {    
    public static void contactValidation(List<Contact> newList){
        for(Contact cont: newList){
            if(cont.Birthdate == null){
                cont.addError('Kindly insert the birthdate');
            }
        }
    }
}