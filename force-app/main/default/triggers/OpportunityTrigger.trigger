trigger OpportunityTrigger on Opportunity (before insert) {
    if(trigger.isBefore){
    OpportunityTriggerHandler.opportunityInsert(trigger.new);
    }
}