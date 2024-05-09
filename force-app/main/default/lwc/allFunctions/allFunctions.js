import { LightningElement, track } from 'lwc';
export default class AllFunctions extends LightningElement {
  @track connect ="HAn";
   
connectedCallback(){
    this.connect = 'Nagendra';
}
}