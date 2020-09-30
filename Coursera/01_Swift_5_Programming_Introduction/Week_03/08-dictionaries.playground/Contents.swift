import UIKit

/*:
 ### Code Example
 */

// Declare an Int to String dictionary.
var namesOfIntegers = [Int : String]()

namesOfIntegers[3] = "three"
namesOfIntegers[44] = "fourty-four"
print(namesOfIntegers)

// This will clean the contents of the dictionary
namesOfIntegers = [:]
print(namesOfIntegers)

// Type inferrence will detect String to Int dictionary.
var ageDictionary = ["John": 33, "Samantha": 14]

// Explicitly mentioning String to String dictionary.
var airports : [String : String] = ["YYZ": "Toronto Pearson", "LAX": "Los Angeles International"]

print("The airports dictionary has: \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty!")
}

// Write a value for key "LHR".
airports["LHR"] = "London"
// Overwrite the value for key "LHR".
airports["LHR"] = "London Heathrow"
// Create an airport that doesn't exist.
airports["DEV"] = "Coder International"
// Sadly because it doesn't exist it's not useful so remove it.
airports["DEV"] = nil

// Using for-each with dictionaries will return (key, value) tuples.
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// Can also iterate with for-each over only the keys.
for key in airports.keys {
    print("Key: \(key)")
}

// Can also iterate with for-each over the values.
for val in airports.values {
    print("Value: \(val)")
}

/*:
 ### Exercise
 
 Consider a real-world dictionary that you might read on your desk.
 
 1.  Create an animal dictionary where the key is the name of the animal and the value should be a string which represents the definition of the animal
 2.  Add ten animals to this dictionary
 3.  Iterate through the dictionary and print the keys and values in this format: `"Animal: X -- Description: Y"` where X is the name of the animal and Y is the description of the animal
 4.  Clear out the entire dictionary and then instead use this dictionary to store United States state abbrieviations and full names (ie CA : California)
 5. Store ten state names and abbreviations in this dictionary and then print them in this format: `Y: X` where Y is the name of the state and where X is the abbreviation
 6. Set the first state you chose to `nil`
 7. Iterate through the array and print each key and value and see what happened to that state you set to nil
 */

var dictionary : [String : String] = [
    "Dog" : "It's nice",
    "Cat" : "It observes",
    "Bird" : "Is not real",
    "Snake" : "Danger noodle",
    "Magpie" : "Bad bird",
]

for (animal, description) in dictionary {
    print("Animal: \(animal) -- Description: \(description)")
}

dictionary = [:]
print(dictionary)

dictionary = [
    "CA" : "California",
    "FL" : "Florida",
    "NY" : "New York",
    "CO" : "Colorado",
    "TX" : "Texas",
    "NV" : "Nevada",
]

// Every time this is run the keys are printed in a different order
// because dictionaries do not preserve order.
for (abbr, state) in dictionary {
    print("\(abbr) : \(state)")
}

print(dictionary.count)
dictionary["TX"] = nil
print(dictionary.count)

// Now the "TX" key should be missing altogether.
for (abbr, state) in dictionary {
    print("\(abbr) : \(state)")
}
