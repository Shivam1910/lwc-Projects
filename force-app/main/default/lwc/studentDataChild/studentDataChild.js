import { LightningElement, api, track } from 'lwc';


export default class StudentDataChild extends LightningElement {
    @api showSelectedCityRecord;
    @track targetId;
    @track thirdChild;
    handleClick(event) {
        this.targetId = event.currentTarget.dataset.id;
        console.log('id is  ', this.targetId);
        if (this.targetId) {
            this.thirdChild = this.showSelectedCityRecord.filter(res => {
                return this.targetId == res.Id;
            });

        }
        console.log('Third child', this.thirdChild);

    }
}