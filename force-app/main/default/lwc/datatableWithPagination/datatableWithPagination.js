/*
API : 52
Source : lwcFactory.com
*/
import {LightningElement} from 'lwc';
//Import apex method 
import fetchContacts from '@salesforce/apex/ContactDataController.fetchContacts';

export default class DatatableWithPagination extends LightningElement {
    
    // JS Properties 
    pageSizeOptions = [10, 15, 20, 30, 50]; 
    records = []; 
    columns = []; 
    totalRecords = 0; 
    pageSize; 
    totalPages; 
    pageNumber = 1;  
    recordsToDisplay = []; 

    get bDisableFirst() {
        return this.pageNumber == 1;
    }

    get bDisableLast() {
        return this.pageNumber == this.totalPages;
    }

    connectedCallback() {
        this.columns = [{
                label: 'Name',
                fieldName: 'Name'
            },
            {
                label: 'Email',
                fieldName: 'Email'
            },
            {
                label: 'Phone',
                fieldName: 'Phone'
            },
            {
                label: 'Title',
                fieldName: 'Title'
            },
        ];

        fetchContacts()
            .then((result) => {
                if (result != null) {
                    console.log('RESULT--> ' + JSON.stringify(result));
                    this.records = result;
                    this.totalRecords = result.length; // update total records count                 
                    this.pageSize = this.pageSizeOptions[0]; //set pageSize with default value as first option
                    this.paginationHelper(); 
                }
            })
            .catch((error) => {
                console.log('error while fetch contacts--> ' + JSON.stringify(error));
            });
    }

    handleRecordsPerPage(event) {
        this.pageSize = event.target.value;
        this.paginationHelper();
    }

    previousPage() {
        this.pageNumber = this.pageNumber - 1;
        this.paginationHelper();
    }

    nextPage() {
        this.pageNumber = this.pageNumber + 1;
        this.paginationHelper();
    }

    firstPage() {
        this.pageNumber = 1;
        this.paginationHelper();
    }

    lastPage() {
        this.pageNumber = this.totalPages;
        this.paginationHelper();
    }


    paginationHelper() {
        this.recordsToDisplay = [];
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
        if (this.pageNumber <= 1) {
            this.pageNumber = 1;
        } else if (this.pageNumber >= this.totalPages) {
            this.pageNumber = this.totalPages;
        }

        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
            if (i === this.totalRecords) {
                break;
            }
            this.recordsToDisplay.push(this.records[i]);
        }
    }
}