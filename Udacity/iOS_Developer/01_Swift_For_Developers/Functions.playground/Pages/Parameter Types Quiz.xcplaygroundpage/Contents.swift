//: [Previous](@previous)
// Function with no parameter names.
func warmUp(_ temperature: Int) -> Int {

    return temperature + 10
}

// Function with external parameter names.
func firstChar(of word: String) -> Character {

    return word[word.startIndex]
}

// Function with only internal parameter names.
func concatenate(firstString: String, secondString: String) -> String {

    return firstString + secondString
}

// No paramter names needed.
warmUp(13)

// Parameter name is `of` even though internally the function uses `word`.
firstChar(of: "Santiago")

// Parameter names are exactly the same as the function uses internally.
concatenate(firstString: "stuff", secondString: "stuffs")
//: [Next](@next)
