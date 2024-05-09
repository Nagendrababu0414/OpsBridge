import { LightningElement, track } from 'lwc';
import getServiceProData from '@salesforce/apex/ServiceProController.getServiceProData';
const columns=[
    {label:'Name', type:'text', field:'Name'},
    {label:'Name', type:'text', field:'Name'}
    
]
export default class ServiceProData extends LightningElement {
    @track Name;
    @track Amount;
    @track serviceData=[];
    columns = columns;
    handleNameChange(event){
        this.Name = event.target.value;
    }
    handleAmountChange(event){
        this.Amount=event.target.value;
    }
    handleClick(){
        getServiceProData({ name: this.Name, amount:this.Amount})
        .then(result => {
            this.serviceData = result;
        })
        .catch(error => {
            console.error('Error fetching accounts:', error);
        });
}
    }