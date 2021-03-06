//: [Previous](@previous)

import Foundation

//: __Exercise 1.__
//:
//:Earlier we used the method, remove() to remove the first letter of a string. This method belongs to the String class. See if you can use this same method to remove the last letter of a string.

var string = "stuff"
string.remove(at: string.index(before: string.endIndex))

//:Test out your discovery below by returning the last letter of the String, "bologna".
var word = "bologna"
word.remove(at: word.index(before: word.endIndex))

//: __Exercise 2__
//:
//: Write a function called combineLastCharacters. It should take in an array of strings, collect the last character of each string and combine those characters to make a new string to return. Use the strategy you discovered in Problem 1 along with a for-in loop to write combineLastCharacters. Then try it on the nonsenseArray below.

var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]

var result : String = ""
for word in nonsenseArray {

    // result.append(word[word.index(before: word.endIndex)])
    result.append(Array(word)[word.count - 1])
}
print(result)


//: __Exercise 3__
//:
//: Imagine you are writing an app that keeps track of what you spend during the week. Prices of items purchased are entered into a "price" textfield. The "price" field should only allow numbers, no letters.
//: CharacterSet.decimalDigitCharacterSet() is used below to define a set that is only digits. Using that set, write a function that takes in a String and returns true if that string is numeric and false if it contains any characters that are not numbers.
func isNumeric(_ input : String) -> Bool {

    // Edge case for empty string, which the code afterwards treats as a subset.
    if input.count == 0 {
        return false
    }

    let decimalsSet = CharacterSet.decimalDigits
    let inputSet = CharacterSet(charactersIn: input)
    // With sets you can do operations such as unions, symmetric differences, sub/super set checks, etc.
    return inputSet.isStrictSubset(of: decimalsSet)
}

print(isNumeric("721000"))
print(isNumeric("721A00"))
print(isNumeric("72100A"))
print(isNumeric("A72100"))
print(isNumeric(""))

//: __3a.__ Write a signature for a function that takes in a String and returns a Bool

func myFunction(_ param : String) -> Bool {

    return true
}

//: __Exercise 4__
//:
//: Write a function that takes in an array of dirtyWord strings, removes all of the four-letter words, and returns a clean array.

let dirtyWordsArray = ["phooey", "darn", "drat", "blurgh", "jupiters", "argh", "fudge"]

func filterFourLetter(_ input : [String]) -> [String] {

    let result : [String] = input.filter { $0.count != 4 }
    return result
}

print(filterFourLetter(dirtyWordsArray))

//: __Exercise 5__
//:
//: Write a method, filterByDirector(), that belongs to the MovieArchive class.  This method should take in a dictionary of movie titles and a string representing the name of a director and return an array of movies created by that director. You can use the movie dictionary below. To test your method, instantiate an instance of the MovieArchive class and call filterByDirector from that instance.

var movies : Dictionary<String, String> = [
    "Boyhood" : "Richard Linklater",
    "Inception" : "Christopher Nolan",
    "The Hurt Locker" : "Kathryn Bigelow",
    "Selma" : "Ava Du Vernay",
    "Interstellar" : "Christopher Nolan"
]

class MovieArchive {

    func filterByDirector(_ films : Dictionary<String, String>, _ director : String) -> [String] {

        let filteredMovies = (films.filter { $0.value == director}).map { $0.key }
        return filteredMovies
    }
}

var archive = MovieArchive()
print(archive.filterByDirector(movies, "Christopher Nolan"))
//: [Next](@next)
