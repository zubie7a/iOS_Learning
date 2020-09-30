import UIKit

//Shape 1
var length = 5
var width = 10

var area = length * width

//Shape 2
var length2 = 6
var width2 = 12

var area2 = length2 * width2

//Shape 3
var length3 = 3
var width3 = 8

var area3 = length3 * width3

// So much repetitive code above, we can abstract it as a function.
func calculateArea(length: Int, width: Int) -> Int {
    return length * width
}

let shape1 = calculateArea(length: length, width: width)
let shape2 = calculateArea(length: length2, width: width2)
let shape3 = calculateArea(length: length3, width: width3)

func doubleInPlace(number: inout Int) {
    number *= 2
}

var value = 22
// `inout` parameters require to pass with a &.
doubleInPlace(number: &value)
print(value)


/*
// This is a version of the purchaseItem function that returns the
// remaining balance, instead of modifying it in-place inside.

 func purchaseItem(currentBalance: Double, itemPrice: Double) -> Double {
    if itemPrice <= currentBalance {
        print("Purchased item for: $\(itemPrice)")
        return currentBalance - itemPrice
    } else {
        print("You are broke. You should learn how to save money.")
        return currentBalance
    }
}

let newBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: sigourneyWeaverAlientStomperShoes)

*/

// All parameters passed into a function in Swift become constants.
// If you want to be able to change them, you can pass them as `inout`
// which means that the value will act as a reference and changes are
// reflected upon on the original value that was provided. This function
// modifies the balance in place so that no value has to be returned.
func purchaseItem(currentBalance: inout Double, itemPrice: Double){
    if itemPrice <= currentBalance {
        currentBalance = currentBalance - itemPrice
        print("Purchased item for: $\(itemPrice)")
    } else {
        print("You are broke.")
    }
}

var bankAccountBalance = 500.00

// Remember that inout arguments can be modified in a function, so constants
// can't be used as inout arguments.
var sigourneyWeaverAlientStomperShoes = 350.00
purchaseItem(currentBalance: &bankAccountBalance, itemPrice: sigourneyWeaverAlientStomperShoes)

var retroLunchBox = 40.00
purchaseItem(currentBalance: &bankAccountBalance, itemPrice: retroLunchBox)

print(bankAccountBalance)

let cities = ["Medellin", "Amsterdam", "Mountain View", "Zanarkand"]
print(cities[3])
print(cities[cities.count - 1])
print(cities.last!)
