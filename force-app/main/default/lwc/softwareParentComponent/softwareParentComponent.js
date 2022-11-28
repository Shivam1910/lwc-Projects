import { api, LightningElement, track, wire } from 'lwc';
import getSoftwareRecords from '@salesforce/apex/SoftwareController.getSoftwareRecords';
import getSoftwareRecord from '@salesforce/apex/SoftwareController.getSoftwareRecord';


export default class SoftwareParentComponent extends LightningElement {

    @track softData;
    showButton = false;
    CompanyName;
    filterRecords;
    @api sendingVar;
    @wire(getSoftwareRecords)
    getSoftwareData({ data, error }) {
        if (data) {
            this.softData = data;
            console.log("Filter Data ", this.softData);
            this.filterRecords = [];
            data.forEach(con => {
                this.filterRecords.push(
                    { label: con.Name, value: con.Name },
                );
            });
            console.log("Filter Data ", this.filterRecords);
        }
        else if (error) {
            console.log("error occured", error);
        }
    }

    handleChange(event) {
        this.CompanyName = event.target.value;
        this.showButton = false;
        //console.log("comapany name", this.CompanyName);
        getSoftwareRecord({ countName: this.CompanyName })
            .then(result => {
                this.sendingVar = result;
                console.log('sending data', this.sendingVar);
            })
            .catch(error => {
                console.log("error", error);

            });
    }

    handleClick() {
        this.showButton = true;
    }

}