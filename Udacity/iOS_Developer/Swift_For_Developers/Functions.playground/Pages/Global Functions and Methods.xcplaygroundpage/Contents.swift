//: # Functions
import Foundation
//: ## Global Functions
//: The functions __print__, __min__, __max__, and __abs__ are a few examples of global functions. Check out a complete list of Swift's global functions [here](http://swiftdoc.org/swift-2/func/).
//print
print("I'm a global function!")

//min
var initialPrice = 50
var bestOffer = 45
var finalPrice = min(bestOffer, initialPrice)

//max
var firstBid = 50
var secondBid = 75
var winningBid = max(firstBid, secondBid)

//abs
var negativeSeven = -7
abs(negativeSeven)

//: ## Methods
// Nice type inference for [String].
let array = ["A", "13", "B", "5", "87", "t", "41"]

class Arithmetic {
    func sumOfStrings(_ aBunchOfStrings: [String]) -> Int {
        // Nice type inference for [String].
        let array = aBunchOfStrings
        var sum = 0
        for string in array {
            // Nice attempt of parsing an integer from a string, returns
            // `nil` if can't be parsed.
            if Int(string) != nil {
                // Because Int(string) returns an optional, needs to convert it with ! (?).
                let intToAdd = Int(string)!
                sum += intToAdd
            }
        }
        return sum
    }
}

// Creating an object is super easy.
var calculator = Arithmetic()
calculator.sumOfStrings(array)
//: [Next](@next)









