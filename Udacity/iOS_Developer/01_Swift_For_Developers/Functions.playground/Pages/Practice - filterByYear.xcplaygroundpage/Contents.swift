//: [Previous](@previous)

import Foundation

class MovieArchive {

    func filterByYear(year:Int, movies:Dictionary<String, Int> ) -> [String]{

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

var aiThemedMovies = [
    "Metropolis" : 1927,
    "2001: A Space Odyssey" : 1968,
    "Blade Runner" : 1982,
    "War Games" : 1983,
    "Terminator" : 1984,
    "The Matrix" : 1999,
    "A.I." : 2001,
    "Her" : 2013,
    "Ex Machina" : 2015
]

var myArchive = MovieArchive()
myArchive.filterByYear(year: 2013, movies: aiThemedMovies)

//: [Next](@next)
