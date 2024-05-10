import { LightningElement, wire, track } from 'lwc';
import getPendingUserStories from '@salesforce/apex/PendingUSerStories.getPendingUserStories';
import updateStatus from '@salesforce/apex/PendingUSerStories.updateStatus';

//import { updateRecord } from 'lightning/uiRecordApi';
const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Status', fieldName: 'Status__c', type: 'Picklist' },
];
export default class PendingUserStories extends LightningElement {
    @track userStories;
    columns = columns;
    @track selectedRows = [];
    @wire(getPendingUserStories)
    wiredUserStories({ error, data }) {
        if (data) {
            this.userStories = data;
        } else if (error) {
        //errors to display    
        }
    }
    /*handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
    }*/
    handleApprove() {
        this.updateStatus('Approved');
    }

    // Handle rejection button click
    handleReject() {
        this.updateStatus('Rejected');
    }
    updateStatus(newStatus) {
        if (this.selectedRows.length > 0) {
            updateStatus({ recordIds: this.selectedRows, newStatus: newStatus })
                .then(() => {
                    // Refresh the data after updating the status
                    return refreshApex(this.userStories);
                })
                .catch((error) => {
                    console.error(error);
                });
        }
    }
}