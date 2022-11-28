import { LightningElement, api } from 'lwc';

export default class SoftwareChildComponent extends LightningElement {
    @api allRecords;
    childRecords;

    connectedCallback() {
        console.log(JSON.parse(JSON.stringify(this.allRecords)));
        this.childRecords = JSON.parse(JSON.stringify(this.allRecords));
        console.log('Child Records', this.childRecords);




    }

}