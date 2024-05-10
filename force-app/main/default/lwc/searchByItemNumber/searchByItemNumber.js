import { LightningElement, track } from 'lwc';
import accItemNumber from '@salesforce/apex/GetAccountItemNumber.accItemNumber'
export default class SearchByItemNumber extends LightningElement {
@track itemName;
@track accItems;
@track acPhone;
@track error ='No records found';
@track acIndustry;
@track temp = false;
@track ifItemNumber = 'ItemNumber';
@track elseBarcode = 'Barcode';
@track elseIndustry = 'Industry';
handleItemNumber(event){
this.itemName = event.target.value;
}
handlerBarcode(event){
this.acPhone = event.target.value;
}
handlerCaseUPC(event){
this.acIndustry = event.target.value;
}

handleClick(){
console.log('this.itemName'+this.itemName)
this.temp = !this.temp;
if(this.ifItemNumber == 'ItemNumber'){
accItemNumber({accName : this.itemName, accPhone : this.acPhone, accIndustry : this.acIndustry})
.then(result=>{
this.accItems = result;
console.table( this.accItems);
console.log(JSON.stringify(this.accItems));
}).catch(error=>
{
    console.error('Error retrieving accounts:', error);
});
} else if(this.elseBarcode == 'Barcode'){
accItemNumber({accPhone : this.acPhone})
.then(result=>{
    this.accItems = result;
    console.table( this.accItems);
    console.log(JSON.stringify(this.accItems));
}).catch(error=>
    {console.error('Error retrieving accounts:', error);
});
} else if(this.elseIndustry == 'Industry'){
accItemNumber({accIndustry : this.acIndustry})
.then(result=>{
    this.accItems = result;
    console.table( this.accItems);
    console.log(JSON.stringify(this.accItems));
}).catch(error=>
    {console.error('Error retrieving accounts:', error);
});
}
}
}