public class CollectiveMaps {

    
    public static void mapsData(){
// Define a map to store employee names and their corresponding salaries
Map<String, Decimal> employeeSalaries = new Map<String, Decimal>();

// Add key-value pairs to the map
employeeSalaries.put('John', 50000);
employeeSalaries.put('Alice', 60000);
employeeSalaries.put('Bob', 55000);

// Retrieve values from the map using keys
Decimal aliceSalary = employeeSalaries.get('Alice');
System.debug('Alice\'s salary: ' + aliceSalary);

// Check if a key exists in the map
if (employeeSalaries.containsKey('John')) {
    System.debug('John\'s salary: ' + employeeSalaries.get('John'));
}

// Iterate over the map entries
for (String employeeName : employeeSalaries.keySet()) {
    Decimal salary = employeeSalaries.get(employeeName);
    System.debug('Employee: ' + employeeName + ', Salary: ' + salary);
}

// Update the value associated with a key
employeeSalaries.put('John', 52000);

// Remove a key-value pair from the map
employeeSalaries.remove('Bob');
    }
}