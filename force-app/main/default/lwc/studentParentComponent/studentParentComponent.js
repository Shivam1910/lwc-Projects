import { LightningElement, wire } from 'lwc';
import getStudentRecords from '@salesforce/apex/StudentDataController.getStudentRecords';
import getStudentRecord from '@salesforce/apex/StudentDataController.getStudentRecord';


export default class StudentParentComponent extends LightningElement {

    studentCity;
    getStudentRecords;
    selectedCity;
    unique;
    selectedCityRecord;

    @wire(getStudentRecords)
    getStudentData({ data, error }) {
        if (data) {
            this.getStudentRecords = data;
            console.log('get student records', this.getStudentRecords);
            if (this.getStudentRecords) {
                this.studentCity = [];
                let unique = [];
                data.forEach(res => {
                    if (!unique.includes(res.City__c)) {
                        unique.push(res.City__c);
                        this.studentCity.push(
                            { "label": res.City__c, "value": res.City__c },

                        );
                    }

                });
            }
            console.log('data', studentCity);
        }
        else if (error) {
            console.log('error', error);
        }
    }
    handleChange(event) {
        this.selectedCity = event.target.value;
        console.log('Selected city', this.selectedCity);
        getStudentRecord({ selectCity: this.selectedCity })
            .then(result => {
                this.selectedCityRecord = result;
                console.log('selected Records', this.selectedCityRecord);
            })
            .catch(error => {
                console.log('selected Records', error);
            });

    }

}