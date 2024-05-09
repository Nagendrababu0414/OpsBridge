import { LightningElement, wire } from 'lwc';
import getAccountRatingPicklistValues from '@salesforce/apex/PicklistValuesController.getAccountRatingPicklistValues';

export default class MyComponent extends LightningElement {
    picklistValues;

    @wire(getAccountRatingPicklistValues)
    wiredPicklistValues({ error, data }) {
        if (data) {
            this.picklistValues = data;
        } else if (error) {
            console.error('Error retrieving picklist values:', error);
        }
    }
}