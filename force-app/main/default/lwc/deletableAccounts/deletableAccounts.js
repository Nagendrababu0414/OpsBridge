// accountList.js
import { LightningElement, wire, track } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';
import deleteAccounts from '@salesforce/apex/AccountController.deleteAccounts';

const columns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
];

export default class AccountList extends LightningElement {
    @track accounts = [];
    @track columns = columns;
    @track selectedRows = [];

    @wire(getAccountList)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error retrieving account data: ', error);
        }
    }

    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
    }

    handleDelete() {
        if (this.selectedRows.length > 0) {
            const accountIds = this.selectedRows.map(row => row.Id);

            // Call Apex method to delete selected accounts
            deleteAccounts({ accountIds })
                .then(() => {
                    // Refresh account list after deletion
                    return refreshApex(this.accounts);
                })
                .catch(error => {
                    console.error('Error deleting accounts: ', error);
                });

            // Clear selected rows after deletion
            //this.selectedRows = [];
        }
    }
}