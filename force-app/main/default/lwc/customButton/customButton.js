import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CustomButton extends LightningElement {
redirectToExample() {
    const event = new ShowToastEvent({
        title: 'Toast Title',
        message: 'Transfering to DC',
        variant: 'success',
    });
    this.dispatchEvent(event);
    setTimeout(() => {
        // Redirect to the new URL after 5 seconds
        window.location.href = 'https://antra-c-dev-ed.my.salesforce.com/_ui/common/apex/debug/ApexCSIPage';
    }, 1000);   
    }
}