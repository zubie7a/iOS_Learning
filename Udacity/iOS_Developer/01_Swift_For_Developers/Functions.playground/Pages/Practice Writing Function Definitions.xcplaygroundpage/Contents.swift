//: [Previous](@previous)

//: ## Practice writing function definitions

//: Example 1 - firstCharacterOf

func firstCharacter(of word: String) -> Character {

     // For some reason in Swift you can't subscript a String with an integer.
     // You have to do it with a String.Index type. Unless you convert `word`
     // an array and then do Int subscript: Array(word)[0].
     return word[word.startIndex]
}

firstCharacter(of: "Mom")

//: Example 2 - placeFirstLetterLast

func placeFirstLetterLast(_ myString: String) -> String {

    var myString = myString

    // Can concatenate with addition or with `append` method.
    // myString += "\(firstCharacter(of: myString))"
    myString.append(firstCharacter(of: myString))
    // The append method works either for String or for Character.
    myString.append("asdfghjk")

    // With this method can remove the character at the start.
    myString.remove(at: myString.startIndex)
    return myString
}

placeFirstLetterLast("Mom")

//: Example 3 - filterByYear

class MovieArchive {

     func filterByYear(year: Int, movies: Dictionary<String, Int>) -> [String] {

        // var filteredArray : [String] = []
        //
        // Loop through dictionary with for-in loop that returns (key, value).
        // for (movie, releaseDate) in movies {
        //     if year == releaseDate {
        //          filteredArray.append(movie)
        //     }
        // }
        //
        // return filteredArray

        // Alternatively, we can use the filter and map function!
        // 1. Filter tuples where the value equals the year.
        // 2. Map to get only the key (movie name) of those tuples.
        let filteredArray = (movies.filter { $0.value == year }).map { $0.key }
        return filteredArray
    }
}

// Huh, in Swift dictionaries apparently use brackets and not braces.
var aiThemedMovies = [
    "Metropolis" : 1927,
    "2001: A Space Odyssey" : 1968,
    "Blade Runner" : 1982,
    "War Games" : 1983,
    "Terminator" : 1984,
    "The Matrix" : 1999,
    "A.I." : 2001,
    "Her" : 2013,
    "Ex Machina" : 2015,
]

var archive = MovieArchive()
print(archive.filterByYear(year: 1999, movies: aiThemedMovies))

//: [Next](@next)
