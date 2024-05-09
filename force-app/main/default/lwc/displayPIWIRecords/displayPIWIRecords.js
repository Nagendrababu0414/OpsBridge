import { LightningElement, wire } from 'lwc';
import getPendingpws from '@salesforce/apex/PIWIController.getPendingpws';

const columns = [
    { label: 'Workitem ID', fieldName: 'Id' },
    { label: 'Process Instance ID', fieldName: 'ProcessInstanceId' }
];

export default class DisplayPIWIRecords extends LightningElement {
    pwiRecords = [];
    columns = columns;

    @wire(getPendingpws)
    wiredRecords({ error, data }) {
        if (data) {
            this.pwiRecords = data.map(record => ({ ...record, key: record.Id }));
        } else if (error) {
            console.error('Error retrieving records:', error);
        }
    }
}