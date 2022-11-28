import { LightningElement, track } from 'lwc';
const columns = [
    { label: 'Product name', fieldName: 'productName', type: 'text' },
    {
        label: 'Amount',
        fieldName: 'amount',
        type: 'currency',
    }
];

const data = [
    {
        id: 'a',
        productName: 'Product 1',
        amount: 1000,
    },
    {
        id: 'b',
        productName: 'Product 2',
        amount: 2000,
    },
    {
        id: 'c',
        productName: 'Product 3',
        amount: 3000,
    },
    {
        id: 'd',
        productName: 'Product 4',
        amount: 4000,
    },
    {
        id: 'e',
        productName: 'Product 5',
        amount: 5000,
    },
    {
        id: 'f',
        productName: 'Product 6',
        amount: 6000,
    },
];

export default class ParentProductStatic extends LightningElement {
    data = data;
    columns = columns;
    selectedRecords
    selectedRowsId = [];
    @track sumAmount = 0;

    handleSelected(event) {
        const selectedRows = event.detail.selectedRows;
        console.log('selected ', selectedRows);
        this.selectedRowsId = selectedRows;
        this.selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
        console.log(this.selectedRecords);
        // Display that fieldName of the selected rows
        this.sumAmount = 0;
        for (let i = 0; i < selectedRows.length; i++) {
            this.sumAmount += selectedRows[i].amount;
        }
        console.log('sumAmount', this.sumAmount);
    }
}
