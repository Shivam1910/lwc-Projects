public class ValidationContact {    // assingment-3 validation trigger class to get list of contact
    public static void contactValidation(List<Contact> newList){
        for(Contact cont: newList){
            if(cont.Birthdate == null){
                cont.addError('Kindly insert the birthdate');
            }
        }
    }
}