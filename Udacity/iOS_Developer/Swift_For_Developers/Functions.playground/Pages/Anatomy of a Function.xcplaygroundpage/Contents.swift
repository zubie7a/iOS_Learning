//: [Previous](@previous)

//: ## Anatomy of a function
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

//:```
//:    func functionName (_ parameterName: parameterType) -> returnType {
//:        statements to execute
//:        return object
//:    }
//:```

let stringToReverse = "Mutable or Immutable? That is the question."

// Returns a String
func reverse(_ string: String) -> String {

    var reversedString = ""
    for character in string {
        reversedString = "\(character)" + reversedString
    }
    return reversedString
}

// Returns nothing, prints out a String
func reverseAndPrintString(_ stringToReverse: String) {

    var reversedString = ""
    for character in stringToReverse {
        reversedString = "\(character)" + reversedString
    }
    print(reversedString)
}

// Takes a named parameter.
func reverseAndPrint(forwardString stringToReverse: String) {

    var reversedString = ""
    for character in stringToReverse {
        reversedString = "\(character)" + reversedString
    }
    print(reversedString)
}

reverseAndPrint(forwardString: "time")
reverseAndPrintString("regal")

//:```
//:    func functionName (externalParameterName localParameterName: parameterType) -> returnType {
//:        statements to execute
//:        return object
//:     }
//:```

//: [Next](@next)
