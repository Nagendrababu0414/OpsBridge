import { LightningElement, api, track } from 'lwc';

export default class FileUpload extends LightningElement {
    @api recordId; // The record ID to which the file should be associated
    @track fileName = '';
    acceptedFormats = ['.pdf', '.png', '.jpg', '.jpeg', '.gif'];

    handleFileNameChange(event) {
        this.fileName = event.target.value;
    }

    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        // You can handle the uploaded files here, e.g., send them to Apex for processing.
        // You can also associate the file with the related record using this.recordId.
    }
}