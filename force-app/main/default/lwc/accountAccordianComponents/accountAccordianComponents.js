import { LightningElement, wire } from 'lwc';
import getAccountRecords from '@salesforce/apex/AccountAccordian.getAccountRecords';

const item = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'FirstName', fieldName: 'FirstName' },
    { label: 'LastName', fieldName: 'LastName' },

];
export default class AccountAccordianComponents extends LightningElement {
    column = item;
    accountRecord;

    @wire(getAccountRecords)
    accountRecords({ data, error }) {
        if (data) {
            this.accountRecord = data;
            console.log('data&&&', this.accountRecord);
        }
        else if (error) {
            console.log('error&&&', error);
        }
    }
}
