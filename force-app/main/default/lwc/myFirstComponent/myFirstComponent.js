import { LightningElement } from 'lwc';
import { ShowToastEvent }  from 'lightning/platformShowToastEvent';

export default class MyFirstComponent extends LightningElement {

    // 1st function
    Handleclick(){
                this.ShowToast();
    }
    // 2nd function
    ShowToast(){
        const event = new ShowToastEvent({
        title: 'show  Toast Demo',
        message: ' toast message is working',
        variant:'Success',
        });
        this.dispatchEvent(event);
    }
}