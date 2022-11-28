import { api, LightningElement, track, wire } from 'lwc';
import countryData from '@salesforce/apex/SoftwareChildParent.countryCountMethod';

export default class SoftwareChildParent extends LightningElement {

    @track countryRecords;
    @track CheckBoxBehaviour = [];

    @wire(countryData)
    getCountryData({ data, error }) {
        if (data) {
            this.countryRecords = data;
        }
        if (error) {
            console.log('Child Error', error);
        }
    }

    checked(event) {
        let countryId = event.currentTarget.dataset.id;
        console.log('CheckBox', countryId);
        if (!this.CheckBoxBehaviour.includes(countryId)) {
            this.CheckBoxBehaviour.push(countryId);
        }
        else {
            this.CheckBoxBehaviour.pop(countryId);
        }
        console.log('countryCount', this.CheckBoxBehaviour);
        console.log('countryCount', this.CheckBoxBehaviour.length);

        const countryCount = new CustomEvent('count', {
            detail: {
                size: this.CheckBoxBehaviour.length
            }
        }
        );
        console.log('countryCount', countryCount);
        this.dispatchEvent(countryCount);
    }
}