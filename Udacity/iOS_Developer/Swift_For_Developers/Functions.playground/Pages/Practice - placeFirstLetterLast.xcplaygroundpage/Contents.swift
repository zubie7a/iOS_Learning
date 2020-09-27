//: [Previous](@previous)
import Foundation

func placeFirstLetterLast(_ myString: String) -> String {

    var myString = myString

    let firstCharacter = myString[myString.startIndex]
    // Can concatenate with addition or with `append` method.
    // myString += "\(firstCharacter(of: myString))"
    myString.append(firstCharacter)

    // With this method can remove the character at the start.
    myString.remove(at: myString.startIndex)
    return myString
}

placeFirstLetterLast("Mom")
//: [Next](@next)
