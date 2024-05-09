import { LightningElement ,track, wire} from 'lwc';
import accData1 from '@salesforce/apex/AccData.accData1';
export default class SpinnerAtPageLoad extends LightningElement {
    @track data
    @track error
    @track spinnerLoad = false
    @wire(accData1)
    accounts({data, error}){
        if(data){
            this.data = data;
            console.table(this.data)
        }else if(error){
            this.error = error
        }
        
    }
}