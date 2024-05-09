import { LightningElement,wire, track } from 'lwc';
import accData from '@salesforce/apex/FetchAccountData.accData';
export default class ChildComp extends LightningElement {
    name = 'Nagendrbabu'
    @track accounts;
    @track error;
    handleClick(){
        this.name = 'Sudha Nagendra'
    }
  constructor(){
    super();
    this.name = 'Livaansh Hanvitha'
    console.log(this.name);
  }

 @wire (accData)
 accDataDisplay({data,error}){
    if(data){
  this.accounts = data;
  console.log(this.accounts)
    }else if(error){
        this.error = error;
        console.log(this.error);
    }

}
}