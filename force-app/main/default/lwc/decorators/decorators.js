import { LightningElement, track } from 'lwc';

export default class Decorators extends LightningElement {
    
   @track name = "LWC" 
   @track NAME
    count = 0
   afterclick(){
        this.NAME = this.name 

    }
    afterclick1(){
        this.count++
    }

}