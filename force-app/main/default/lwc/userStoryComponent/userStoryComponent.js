import { LightningElement, wire, track } from 'lwc';
import getPendingUserStories from '@salesforce/apex/UserStoryController.getPendingUserStories';
import updateRecordStatus from '@salesforce/apex/UserStoryController.updateRecordStatus';

const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Status', fieldName: 'Status__c', type: 'picklist' },
];

export default class UserStoryComponent extends LightningElement {
   @track userStories = [];
    columns = columns;
   @track selectedRows = [];

    @wire(getPendingUserStories)
    wiredUserStories({ error, data }) {
        if (data) {
            this.userStories = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
    }
    handleApprove() {
        if (this.selectedRows.length > 0) {
            const recordIds = this.selectedRows.map(row => row.Id);
            updateRecordStatus({ recordIds })
                .then(() => {
                    // Refresh the data table or handle the update as needed
                    this.userStories = this.userStories.filter(user_Story__c => !recordIds.includes(user_Story__c.Id));
                    this.selectedRows = [];
                })
                .catch(error => {
                    console.error(error);
                });
        }
        
    }
    handleReject() {
        if (this.selectedRows.length > 0) {
            const recordIds = this.selectedRows.map(row => row.Id);
            updateRecordStatus({ recordIds })
                .then(() => {
                    // Refresh the data table or handle the update as needed
                    this.userStories = this.userStories.filter(user_Story__c => !recordIds.includes(user_Story__c.Id));
                    this.selectedRows = [];
                })
                .catch(error => {
                    console.error(error);
                });
        }
        
    }
}