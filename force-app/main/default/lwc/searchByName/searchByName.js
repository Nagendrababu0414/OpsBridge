import { LightningElement, track } from 'lwc';
import getAccountsByName from '@salesforce/apex/GetAccountItemNumber.getAccountsByName'
const columns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Billing City', fieldName: 'BillingCity', type: 'text' },
    { label: 'Billing State', fieldName: 'BillingState', type: 'text' }
];
export default class SearchByName extends LightningElement {
    @track accountName = '';
    @track accounts;
    columns = columns;

    handleAccountNameChange(event) {
        this.accountName = event.target.value;
    }

    handleSearch() {
        getAccountsByName({ accountName: this.accountName })
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                console.error('Error retrieving accounts:', error);
            });
    }
}