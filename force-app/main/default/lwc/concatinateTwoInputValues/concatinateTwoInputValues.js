import { LightningElement } from 'lwc';

export default class ConcatinateTwoInputValues extends LightningElement {
    first
    last
    fullname
    firstValue(event){
        this.first = event.target.value 
    }
    lastValue(event){
        this.last = event.target.value 
    }

    enterfullname(){
            this.fullname = this.first+' '+this.last
    }


}