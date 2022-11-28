import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/WireDemoClassByShivam.getContactList';

const columns = [
    { label: 'Name', fieldName: "Name" },
    { label: "Record Id", fieldName: 'Id' },
];
export default class WireDemoByShivam extends LightningElement {
    @track columns = columns;
    @track data = [];

    @wire(getContactList)
    wiredContact({ data, error }) {
        if (data) {
            this.data = data;

        }
        else if (error) {
            console.log("error occured")
        }
    }

}
