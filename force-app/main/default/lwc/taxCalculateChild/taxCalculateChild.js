import { LightningElement, api } from 'lwc';
export default class TaxCalculateChild extends LightningElement {
    @api total;
    @api totalwithtex;

}
