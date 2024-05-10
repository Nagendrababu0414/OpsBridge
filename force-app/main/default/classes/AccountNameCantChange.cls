public class AccountNameCantChange {
public static void m1(List<Account> accList){
		List<Account> accList2 =[SELECT Name from Account];
for(Account a : accList){
	for(Account acc:accList2){
		if(a.Name!=acc.Name){
			a.addError('name you cant change');
		}
	}
}
	}
}