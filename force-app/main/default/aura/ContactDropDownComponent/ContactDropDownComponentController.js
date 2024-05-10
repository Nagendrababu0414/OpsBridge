({
	myAction : function(component, event, helper) {
		var con = component.get("c.contactDropDown");
        con.setCallback(this,function(response){
          var cont =  response.getState();
            if(cont =="SUCCESS"){
            component.set("v.result", response.getReturnValue());
            }
        }),
           $A.enqueueAction(con); 
	},
    anyAction : function(component, event, helper) {
		var con = component.get("c.contactDropDown1");
        var a = component.get('v.slt');
        con.setParam('nm' , a);
        con.setCallback(this,function(response){
          var cont =  response.getState();
            if(cont =="SUCCESS"){
            component.set("v.result1", response.getReturnValue());
            }
        }),
           $A.enqueueAction(con); 
	}
})