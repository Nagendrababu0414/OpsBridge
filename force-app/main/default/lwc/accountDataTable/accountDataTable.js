import { LightningElement, wire, track } from 'lwc';
import getAccountData from '@salesforce/apex/AccountControler.getAccountData';
import updateAccountData from '@salesforce/apex/AccountControler.updateAccountData';

const columns = [
    {
        label: 'Account Name',
        fieldName: 'Name',
        type: 'text',
        cellAttributes: { class: 'editable-cell' },
        editable: true,
    },
    {
        label: 'Industry',
        fieldName: 'Industry',
        type: 'text',
        cellAttributes: { class: 'editable-cell' },
        editable: true,
    },
];

export default class AccountDataTable extends LightningElement {
    @track accounts = [];
    @track draftValues = [];
    columns = columns;
    @wire(getAccountData)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error fetching account data:', error);
        }
    }

    handleSave(event) {
        // Handle the save event
        const updatedFields = event.detail.draftValues;

        // Map the updatedFields to the original data
        const updatedData = this.accounts.map(record => {
            const updatedField = updatedFields.find(field => field.rowKey === record.Id);
            return updatedField ? { ...record, ...updatedField } : record;
        });

        // Update the draftValues
        this.draftValues = updatedFields;

        // Call the Apex method to update the records
        updateAccountData({ data: updatedFields })
            .then(result => {
                // Handle the result if needed
            })
            .catch(error => {
                console.error('Error updating records:', error);
            });
    }
}