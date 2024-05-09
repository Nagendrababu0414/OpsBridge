import { LightningElement, wire, track } from 'lwc';
import getPendingpws from '@salesforce/apex/PIWIController.getPendingpws';
import updateRecordStatus from '@salesforce/apex/PIWIController.updateRecordStatus';

const columns = [
    { label: 'PIWI ID', fieldName: 'ID'}, 
    { label: 'ProcessInstance Id', fieldName: 'ProcessIntanceID'}, 

];

export default class PIWIToApprove extends LightningElement {
   @track piwis = [];
    columns = columns;
   @track selectedRows = [];

    @wire(getPendingpws)
    wiredUserStories({ error, data }) {
        if (data) {
            this.piwis = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
        //console.log("Rows"+selectedRows)
        
    }
    handleApprove() {
        if (this.selectedRows.length > 0) {
            const recordIds = this.selectedRows.map(row => row.Id);
            updateRecordStatus({ recordIds })
                .then(() => {
                    // Refresh the data table or handle the update as needed
                    this.piwis = this.piwis.filter(ProcessInstanceWorkitem => !recordIds.includes(ProcessInstanceWorkitem.Id));
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
                    this.piwis = this.piwis.filter(ProcessInstanceWorkitem => !recordIds.includes(ProcessInstanceWorkitem.Id));
                    this.selectedRows = [];
                })
                .catch(error => {
                    console.error(error);
                });
        }
        
    }
}