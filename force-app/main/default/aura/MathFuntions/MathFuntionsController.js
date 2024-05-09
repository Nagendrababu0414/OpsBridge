({
	add : function(component, event, helper) {
		var fn=component.get('v.fnum')
        var sn=component.get('v.snum')
        var add=parseInt(fn)+parseInt(sn);
        component.set('v.calci',add)
	},
    sub : function(component, event, helper){
		var fn=component.get('v.fnum')
        var sn=component.get('v.snum')
        var sub=parseInt(fn)-parseInt(sn);
        component.set('v.calci',sub)
	},
    multi : function(component, event, helper) {
		var fn=component.get('v.fnum')
        var sn=component.get('v.snum')
        var mult=parseInt(fn)*parseInt(sn);
        component.set('v.calci',mult)
	},
})