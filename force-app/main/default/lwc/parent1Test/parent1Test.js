import { LightningElement, api, track } from 'lwc';

export default class Parent1Test extends LightningElement {
    @api name = 'Nagendrababu'
    @api design = 'SFDC Developer'
    @track myName    //console.log(this.design)
    firstFn(){
        this.myName = 'SFDC'

    }
}