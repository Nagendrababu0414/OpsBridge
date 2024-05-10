({
	name : function(component, event, helper) {
		var strFName= component.get('v.str1');
        var strLname = compnent.get('v.str2');
        var fullName = strFName + strLname;
        var click = $A.get("e.c:setComponentToOtherComponentEvent");
        click.setParams({'name': fullName});
        click.fire();
        
	}
})