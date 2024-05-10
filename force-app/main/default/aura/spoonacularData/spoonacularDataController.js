({
	showData : function(component, event, helper) {
        var a = component.get('v.firstnum');
		var act = component.get('c.getDataFromSpoonacular');
        $A.enqueueAction(act , false);
        act.setParam('num' , a );
        
        act.setCallback(this , function(response){
             var rtn = response.getReturnValue();
                  component.set('v.resp' , rtn);      
            var b = component.get('v.resp')['recipes'];
            component.set('v.spoonacularList' , b);
    })
        
	}
})