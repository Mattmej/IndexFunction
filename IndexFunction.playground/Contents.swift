//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

/*
 
 Goal: create function that returns index of a string of letters that fits a predetermined string. The index will be of the letter that comes first in the predetermined string.
 
 Game plan:
 1. Create a string variable. (here, call it "str")
 2. Convert string to lowercase.
 3. Make function
    a. Take in a string
    b. If all characters of the string are inside "str," look for the character that comes first in "str"
    c. Then, take that first character and return the index.
    d. If all characters are NOT in "str," then return an index of -1.
 
 Perhaps use character sets
 
 */

//var str = "First"

var charCollection = ""

func isInStr(input: String, str: String) -> Bool {
    let ourStr = input.lowercased()
    var originalStr = str.lowercased()
//    let originalStrWithoutDuplicates = originalStr.remove
    
    
    // Loops through the characters in the string input
    for character1 in ourStr {
        print("character1 = \(character1)")
        print("-------")
        
        // Compares this character to each character in the original string
        for character2 in originalStr {
            
            print("character2 = \(character2)")
            
            // If the input character matches the original string's character...
            if character1 == character2 {
                
                // Add the character to "charCollection"
                charCollection += String(character1)
                
                // Remove the input character from the original string
                originalStr = originalStr.replacingOccurrences(of: String(character1), with: "")
                
                // Exit the comparison loop (go to next input character)
                break
            }
                
            // If the input character does NOT match the original string's character...
            else {
                
                // Continue with the comparison loop.
                continue
            }
            
        }
        
        print("")
        print("=======")
    }
    
    // -------- End of Loop --------
    
    print("charCollection = \(charCollection)")
    // If the characters we collected matches our input string, return true.
    if charCollection == ourStr {
        return true
    }
    
    // If not, return false.
    else {
        return false
    }
    
}

//charsFromStr(input: "Fir")

//isInStr(input:"Fir", str:"First")
//isInStr(input:"sss", str:"First")

func findStringIndex(input:String, str:String) -> Int {
    
//    let ourStr = input.lowercased()
    var originalStr = str.lowercased()
    var smallestNum: Int = str.count
    
    if isInStr(input: input, str: str) {
//        return 1
        var dictionary: [String:Int] = [:]
        
        for character in charCollection {
//            let offset = find(originalStr, character)
//            let diff = originalStr.distance(from: originalStr.startIndex, to:Int(originalStr.index(of:character)))
//            dictionary[String(character)] = originalStr.index(of: character)
            
            let index = originalStr.index(of: character)?.encodedOffset
//            let indexIntVal = originalStr.distance(from: originalStr.startIndex, to: index!)
            
//            dictionary[String(character)] = Int(originalStr.index(of: character))
            dictionary[String(character)] = index
            
        }
        
        print(dictionary)
        
//        return 1
        
        // loop through dictionary
        
        var keyArray = Array(dictionary.keys)
//        var smallestNum: Int
        
        for i in 0..<dictionary.count-1 {
            smallestNum = (dictionary[keyArray[i]])!
//            var value1: Int = keyArray[i]
//            var value: Int = Int(keyArray[i+1])!
            var value: Int = (dictionary[keyArray[i+1]])!

            if smallestNum > value {
                smallestNum = value
            }

            else {
                continue
            }
            print(smallestNum)
//            return smallestNum
        }
//        print(keyArray)
        
//        return 1
        return smallestNum
    }
    
    else {
        return -1
    }
}

//findStringIndex(input: "sss", str: "First")
//findStringIndex(input: "rfi", str: "First")
findStringIndex(input: "play", str: "Hello, playground")


