import { LightningElement, wire, track } from 'lwc';
import contactRecords from '@salesforce/apex/ContactSelectCityPicklistController.contactRecords'

const column = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'City', fieldName: 'City__c' },
    { label: 'Email', fieldName: 'Email' },

];
export default class ContactSelectCityPicklist extends LightningElement {

    columns = column;
    @track contactRecordsToShow;
    @track contactRecordsToShowTemp;
    @track options;
    selectedCity;

    @wire(contactRecords)
    contactRecordMethod({ data, error }) {
        if (data) {
            this.contactRecordsToShow = data;
            this.contactRecordsToShowTemp = data;
        }
        if (error) {
            console.log('error occured', error);
        }
    }

    @wire(contactRecords)
    contactRecordMethodPickList({ data, error }) {
        if (data) {
            this.options = [];
            data.forEach(con => {
                this.options.push(
                    { "label": con.City__c, "value": con.City__c },
                );
            });
        }
        if (error) {
            console.log('error occured', error);
        }
    }


    handleChange(event) {
        this.selectedCity = event.target.value;

        this.contactRecordsToShow = this.contactRecordsToShowTemp.filter(con => {
            return this.selectedCity == con.City__c;
        });

    }




}