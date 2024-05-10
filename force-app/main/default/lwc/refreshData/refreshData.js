import { LightningElement, wire, track } from 'lwc';
import refreshMethod from '@salesforce/apex/RefreshHanlder.refreshMethod';

const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Rating', fieldName: 'Rating', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' }
];

export default class RefreshData extends LightningElement {
    @track loadedData=[];
    @track data=[];
    pageSizeOptions = [5, 10, 25, 50, 75, 100];
    columns = columns;
    totalRecords = 0;
    msg = '';
    pageSize = 5;
    totalPages = 0;
    pageNumber = 1;
    recordsToDisplay = [];

    renderedCallback() { 
        this.loadedData = this.data;
    }
    get bDisableFirst() {
        return this.pageNumber === 1;
    }

    get bDisableLast() {
        return this.pageNumber === this.totalPages;
    }
    @wire(refreshMethod)
    Accounts({ error, data }) {
        if (data) {
            this.data = data;
            this.totalRecords = this.data.length;
            this.paginationHelper();
        } else if (error) {
            console.error('Error fetching records:', error);
        }
    }

    handleRecordsPerPage(event) {
        this.pageSize = parseInt(event.target.value, 10);
        this.pageNumber = 1; // Reset page number when changing page size
        this.paginationHelper();
    }

    previousPage() {
        if (this.pageNumber > 1) {
            this.pageNumber -= 1;
            this.paginationHelper();
        }
    }

    nextPage() {
        if (this.pageNumber < this.totalPages) {
            this.pageNumber += 1;
            this.paginationHelper();
        }
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
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
        const startIndex = (this.pageNumber - 1) * this.pageSize;
        const endIndex = Math.min(startIndex + this.pageSize, this.totalRecords);
        this.recordsToDisplay = this.data.slice(startIndex, endIndex);
    }
}