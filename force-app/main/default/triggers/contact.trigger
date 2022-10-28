// validation rule using trigger.

trigger contact on Contact (before insert) {// events
    if(trigger.isBefore){// context variable
        ValidationContact.contactValidation(trigger.new);// class name and method name.
    }
}