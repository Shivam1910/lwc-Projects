import { LightningElement, track } from 'lwc';
export default class TaxCalculateParent extends LightningElement {
    @track total;
    @track totalwithtax;
    price = 0;
    qty = 0;
    handleChange(event) {

        if (event.target.name == 'price') {
            this.price = event.target.value;
            console.log('price', this.price);
        }
        if (event.target.name == 'qty') {
            this.qty = event.target.value;
            console.log('qty', this.qty);
        }
        this.total = this.price * this.qty;
        this.totalwithtax = this.total + (this.total * 5) / 100;
    }
}
