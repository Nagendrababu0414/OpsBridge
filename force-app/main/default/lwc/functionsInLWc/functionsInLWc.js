import { LightningElement,track} from 'lwc';

export default class FunctionsInLWc extends LightningElement {
    @track fr;
    @track changedName;
        handleChange(event){
this.fr = event.target.value
   }    
        handleClick(){
this.changedName = this.fr;
        }
    }