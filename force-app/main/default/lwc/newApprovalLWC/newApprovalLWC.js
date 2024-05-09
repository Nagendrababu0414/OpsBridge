import { LightningElement, wire, track } from 'lwc';
import getPendingpws from '@salesforce/apex/PIWIController.getPendingpws';
import recordsApproval from '@salesforce/apex/PIWIController.recordsApproval';
import recordsReject from '@salesforce/apex/PIWIController.recordsReject';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
 
const columns = [
    { label: 'Id', fieldName: 'idi'  },
    { label: 'Name', fieldName: 'name' },
    { label: 'Status', fieldName: 'status' },
    { label: 'Submitted By', fieldName: 'submittedby' }
];

export default class NewApprovalLWC extends LightningElement {
    @track piwis;
    draftValues=[];
    columns = columns;
    selectedRecordsId ;
    selectedRecordsCount1;
    
    @wire(getPendingpws)
    wiredUserStories({ error, data }) {
        if (data) {
            this.piwis = data;
            this.columns = columns;
        } else if (error) {
            console.error(error);
        }
    }


    selectedRecordsHandler1(event){
        const selectedRows =  event.detail.selectedRows;
        console.log("Selected Rows = "+selectedRows)
        this.selectedRecordsCount1 = event.detail.selectedRows.length;
    
        let recordsSets = new Set();
        // getting selected record id
        for (let i = 0; i < selectedRows.length; i++) {
            recordsSets.add(selectedRows[i].Id);
        }
    
        // coverting to array
         this.selectedRecordsId = selectedRows;
         console.log("selectedRecordsId = "+this.selectedRecordsId);
         console.log("selectedRecordsId = "+JSON.stringify(this.selectedRecordsId));
}
 
 
    handleApprove() {
        // Call the Apex method with the selected record Ids
        console.log("selectedRecordsId=== = "+JSON.stringify(this.selectedRecordsId));
        recordsApproval({ pilList : this.selectedRecordsId })
            .then(result => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Approval Request sent successful',
                    variant: 'success',
                }),
            );
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Failed',
                    message: 'Authentication Error. Please Authenticate again',
                    variant: 'error',
                }),
            );
        })
    }

    handleReject() {
        // Call the Apex method with the selected record Ids
        recordsReject({ pilList : this.selectedRecordsId })
            .then(result => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Rejection Request sent successful',
                    variant: 'success',
                }),
            );
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Failed',
                    message: 'Authentication Error. Please Authenticate again',
                    variant: 'error',
                }),
            );
        })
    }

    
}