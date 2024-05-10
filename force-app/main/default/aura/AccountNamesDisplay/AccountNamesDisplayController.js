({
	myAction : function(component, event, helper) {
		var nag = component.get('c.accNamesRetrieve');
        $A.enqueueAction(nag, false);
        nag.setCallBack(this,funtion(response));
        var accname = response.getReturnValue();
        var lst =[];
        for(var i=0; i<=accname.length; i++){
            var item = {"label" :accname[i].name};
            accname.push(item);
            component.set('v.displayList',lst);
        }
	}
});