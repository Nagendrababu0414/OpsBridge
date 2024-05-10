import { LightningElement, track } from 'lwc';
import getCombinedData from '@salesforce/apex/SalesServicesController.getCombinedData';
const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Sales Amount', fieldName: 'SalesAmount', type: 'currency' },
    { label: 'Service Amount', fieldName: 'ServiceAmount', type: 'currency' },
    { label: 'Sales and Service Amount', fieldName: 'salesServiceAmount', type: 'currency' },
    { label: 'Category', fieldName: 'categories', type: 'text' },
    {
        label: 'Start Date', fieldName: 'startingDate', type: 'date',
        typeAttributes: { year: 'numeric', month: 'numeric', day: 'numeric' }, sortable: true, width: 100
    },
    { label: 'Date 1', fieldName: 'date1', type: 'date', sortable: true, width: 80, hidden: false },
    { label: 'Date 2', fieldName: 'date2', type: 'date', sortable: true, width: 80, hidden: false },
    { label: 'Date 3', fieldName: 'date3', type: 'date', sortable: true, width: 80, hidden: false },
    { label: 'Date 4', fieldName: 'date4', type: 'date', sortable: true, width: 80, hidden: false },
    { label: 'Date 5', fieldName: 'date5', type: 'date', sortable: true, width: 80, hidden: false },
    { label: 'Date 6', fieldName: 'date6', type: 'date', sortable: true, width: 80, hidden: false },
];

export default class SalesServicesDataTable extends LightningElement {
    columns = columns;
    @track formattedData = [];
    @track startDate;
    @track selectedCategories = [];
    @track selectedPickOptions =
        [{ label: 'High-Value Customer', value: 'High-Value Customer'},
        { label: 'Standard Customer', value: 'Standard Customer' },
        { label: 'Prospect', value: 'Prospect' },
        { label: 'Partner', value: 'Partner' },
        { label: 'Active', value: 'Active' },
        { label: 'Inactive', value: 'Inactive' }];
    handleDateChange(event) {
        this.startDate = event.target.value;
        console.log(this.startDate);
    }
    handleCategoryChange(event) {
        this.selectedCategories = event.target.value;
        console.log(this.selectedCategories);
    }
  
    handleButtonClick() {
        this.loadCombinedData();
        console.log(JSON.stringify(this.loadCombinedData));
        
    }
    loadCombinedData() {
        getCombinedData({ categoryList: this.selectedCategories, startDate: this.startDate })
            .then(result => {
                this.formatData(result);
            })
            .catch(error => {
                console.error('Error loading data:', error);
            });
    }
    formatData(result) {
        this.formattedData = result.map(record => ({
            Name: record.Name,
            SalesAmount: record.SalesAmount ? record.SalesAmount : 0,
            ServiceAmount: record.ServiceAmount ? record.ServiceAmount : 0,
            categories: record.categories,
            startingDate: record.startingDate
        }));
    }
}