({
	saveButton : function(component, event, helper) {
		var a =	event.getSource().getLocalId();
        if(a=='b1'){
            component.set('v.msg','You are anonymous....')
        }
        if(a=='b2'){
            component.set('v.msg','Innocent Boy')
        }
        if(a=='b3'){
            component.set('v.msg','I don\'t Comment on Girls..... ')
        }
        
        if(a=='b4'){
            component.set('v.msg','Hidden Kim Jong')
        }
        if(a=='b5'){
            component.set('v.msg','Thanks for stopping saying AAAAAAA...... ')
        }
        if(a=='b6'){
            component.set('v.msg','DJ Tillu...')
        }
        if(a=='b7'){
            component.set('v.msg','More than Hulk....')
        }
        if(a=='b8'){
            component.set('v.msg','Vakkalagadda Bidda...')
        }
	}
})