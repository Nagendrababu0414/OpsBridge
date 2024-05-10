// conditionalFields.js
import { LightningElement, track } from 'lwc';

export default class ConditionalFields extends LightningElement {
    @track isChecked = false;
    @track name = '';
    @track age = '';

    handleCheckboxChange(event) {
        this.isChecked = event.target.checked;

        // Clear fields if checkbox is unchecked
        if (!this.isChecked) {
            this.name = '';
            this.age = '';
        }
    }
}