import { LightningElement, track, wire } from 'lwc';
import getUserRec from '@salesforce/apex/ShowUserComponent.getUserRec';

export default class Showusercomponent extends LightningElement {
    @track userRecords;
    @track searchName;
    @track userTemp;
    @track totalCount;


    @wire(getUserRec)
    getUserData({ data, error }) {
        if (data) {
            this.userRecords = data;
            this.userTemp = data;
            this.totalCount = this.userRecords.length;
        }
        else if (error) {
            this.userRecords = error;
        }
    }

    handleChange(event) {
        this.searchName = event.target.value;


    }
    handleClick() {
        if (this.searchName != null) {
            this.userRecords = this.userTemp.filter(con => con.Name.indexOf(this.searchName) !== -1);
        }
        this.totalCount = this.userRecords.length;

    }
}