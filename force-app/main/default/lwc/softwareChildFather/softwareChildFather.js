import { api, LightningElement, track } from 'lwc';


export default class SoftwareChildFather extends LightningElement {
    @track countryCount;

    countcountry(event) {
        console.log('detail : ', JSON.parse(JSON.stringify(event.detail)));
        let temp = JSON.parse(JSON.stringify(event.detail));
        this.countryCount = temp.size;
        console.log('countryCount>>>', this.countryCount);
    }
}
