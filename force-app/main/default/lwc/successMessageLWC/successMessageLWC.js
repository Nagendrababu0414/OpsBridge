import { LightningElement, api } from 'lwc';

export default class SuccessMessageLWC extends LightningElement {
    @api showSuccessMessage = false;
    @api successMessage = 'Pending items are approved successfully!';
}