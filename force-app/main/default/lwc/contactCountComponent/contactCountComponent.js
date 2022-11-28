import { LightningElement, wire } from 'lwc';
import getAllRecords from '@salesforce/apex/ContactCountClass.getRecords';
const columns = [
    { label: 'Serial No.', fieldName: 'serialNo' },
    { label: 'Account Name', fieldName: 'accountName' },
    { label: 'Contact Counts', fieldName: 'contactCount' }
];

export default class ContactCountComponent extends LightningElement {
    column = columns;
    @wire(getAllRecords)
    allData

}
