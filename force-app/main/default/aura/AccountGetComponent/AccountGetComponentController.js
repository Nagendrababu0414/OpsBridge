({
    doInit : function(component, event, helper) {
        var acc = component.get("");
        acc.setCallback(this,function(response){
        var st = response.getState();
        if(st ==="SUCCESS"){
            component.set("v.acList", response.getReturnValue());
        }
    }),
            $A.enqueueAction(acc);
}
 })