import { LightningElement, api, track } from 'lwc';
export default class ChildProductStatic extends LightningElement {
    @api columns;
    @api selectedRecords;
    @api sumAmount;
}