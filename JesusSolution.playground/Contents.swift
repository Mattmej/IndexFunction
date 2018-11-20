//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//import UIKit
//
//var str = "Hello, playground"

extension String {
    
    // Returns first index of a match of a string in a string.
    func customIndexOf(word: String) -> Int {
        
        // Just setting the letters into a dictionary (the letters of the string you want to find)
        // The value is how many times each letter appears
        let wordAsDictionary = convertStringToDictionary(word: word)
        
        // Length of the string you want to find
        let count = word.count
        
        // We will look at substrings that are the length of the string we want to find.
        // So, we need to iterate through less iterations than there are characters in the original string.
        let end = self.count - count
        
        //Compares all ranges of N by N, being N the number of letters to look for
        for i in 0..<end {
            if hasSameLiterals(of: wordAsDictionary, from: i, to: i + count) {
                return i
            }
        }
        
        return -1
    }
    
    //Returns true if both the range of the phrase and the word we're looking for are the same according to their dictionaries
    private func hasSameLiterals(of word: [Character : Int], from start: Int, to end: Int) -> Bool {
        
        // gives index between first and second arguments.
        // Between beginning of string to start of the letters you wish to retrieve.
        let lowerBound = self.index(self.startIndex, offsetBy: start)
        
        // Iterates from the beginning of the string to the number of letters you wish to retrieve
        let upperBound = self.index(self.startIndex, offsetBy: end)
        
        let subString = String (self[lowerBound..<upperBound])
        
        // Dictionary for the substrings
        let selfAsDictionary = convertStringToDictionary(word: subString)
        
        return selfAsDictionary == word
    }
    
    //Converts a String to a Dictionary for easy comparison.
    private func convertStringToDictionary(word: String) -> [Character : Int] {
        var dictionary: [Character : Int] = [ : ]
        
        for letter in word {
            
            // If the letter of the word is in the dictionary...
            if let l = dictionary[letter] {
                dictionary[letter] = l + 1
            } else {
                dictionary[letter] = 1
            }
        }
        
        return dictionary
    }
}

print (str.customIndexOf(word: "play"))
