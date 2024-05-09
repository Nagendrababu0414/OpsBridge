import { LightningElement } from 'lwc';

export default class BasicExampleUsingsSlds extends LightningElement {
    phone;
    date;
    numbervalidation(event){
      this.phone = event.target.value
     }
     datevalidation(event){
        this.phone = event.target.value
       }
}