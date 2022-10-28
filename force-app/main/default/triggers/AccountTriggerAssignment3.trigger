trigger AccountTriggerAssignment3 on Account (after insert ) {
    
    if(trigger.isAfter){
        
         AccountHandlerAssignment2.accountUpdate(trigger.new);
    }
    
    
}