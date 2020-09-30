import UIKit

/*:
 ### Code Example
 */
var employee1Salary = 45000.0
var employee2Salary = 54000.0
var employee3Salary = 100000.0
var employee4Salary = 20000.0

var employeeSalaries: [Double] = [45000.0,54000.0,100000.0, 20000.0]

print(employeeSalaries.count)

employeeSalaries.append(39000.34)

print(employeeSalaries.count)

employeeSalaries.remove(at: 1)

print(employeeSalaries.count)

var person: [Any] = ["John",21,158.7, true, "I like long walks"]

var students = [String]()

print(students.count)

students.append("Jon")
students.append("Jacob")
students.append("Jose")
students.append("Jingle")
students.append("Heimer")
students.append("Smith")
students.insert("Bob", at: 2)

print(students)

students.remove(at: 2)

print(students)

/*:
 ### Exercise
 
 1.  Create an array that stores the names of 6 different donuts
 2.  Create a 2nd array that stores the quantity of each of those donuts as an Int
 3.  Remove the last donut in the array and the corresponding last quantity in the quantity array
 4.  Add a new donut name at the beginning of the donut names array and add a new quantity of 0 (zero)  at the beginning of the quantity array
 5.  Remove all elements in both arrays
 
 */

var donuts : [String] = ["Normal", "Glazed", "Chocolate", "Crispy", "Strawberry", "Secret"]
var amounts : Array<Int> = [8, 2, 7, 4, 2, 1]

// Remove the last elements.
donuts.remove(at: donuts.count - 1)
amounts.remove(at: amounts.count - 1)

// Insert at the beginning.
donuts.insert("Special", at: 0)
amounts.insert(0, at: 0)

print(donuts)
print(amounts)

// Without the () this won't work like it would on Python, no idea why.
// donuts, amounts = ["Last"], [1]
(donuts, amounts) = (["Last"], [1])
print(donuts)
print(amounts)

// Clean both arrays.
(donuts, amounts) = ([], [])
print(donuts, amounts)
