import { LightningElement , track} from 'lwc';
import accData1 from '@salesforce/apex/AccData.accData1';
export default class SpinnerWithData extends LightningElement {
   @track accList1;
   @track error; 
   @track spinnerLoad = false;
    handleclick() {
this.spinnerLoad = true;
        accData1()
          .then(result => {
            console.table(result)
            this.accList1 = result;
            this.spinnerLoad = false;
            //console.log(result);
          })
          .catch(error => {
            this.error = error;
            this.spinnerLoad = false;
            //console.error(error);
          });
}
}