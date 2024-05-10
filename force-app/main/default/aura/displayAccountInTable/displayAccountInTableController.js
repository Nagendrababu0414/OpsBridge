({
	accAction : function(component, event, helper) {
		var ac =component.get('v.accList');
        $A.enqueueAction(ac,false);
        ac.setCallback(this,function(response){
                   var resp=response.getReturnValue();   
        if(resp!=''){
            component.set('v.accountList',resp);
            component.set('v.status',true);
        }	
        else{
            component.set('v.msg', 'sorry, no account list to display');
            component.set('v.status',false);
        }
    });
	}
})