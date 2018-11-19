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
        
        // Separators for the console logs.
        print("")
        print("=======")
    }
    
    // -------- End of Loop --------
    
    // Prints our current collection of characters
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







func findStringIndex(input:String, str:String) -> Int {
    
    var originalStr = str.lowercased()
    var smallestNum: Int = str.count
    
    if isInStr(input: input, str: str) {
        
        var dictionary: [String:Int] = [:]
        
        for character in charCollection {

            
            let index = originalStr.index(of: character)?.encodedOffset
            
//            dictionary[String(character)] = Int(originalStr.index(of: character))
            dictionary[String(character)] = index
            
        }
        
        print(dictionary)
        
        
        // loop through dictionary
        
        var keyArray = Array(dictionary.keys)
        
        for i in 0..<dictionary.count-1 {
            smallestNum = (dictionary[keyArray[i]])!

            var value: Int = (dictionary[keyArray[i+1]])!

            if smallestNum > value {
                smallestNum = value
            }

            else {
                continue
            }
            print(smallestNum)
        }
        
        return smallestNum
    }
    
    else {
        return -1
    }
}




//findStringIndex(input: "sss", str: "First")
//findStringIndex(input: "rfi", str: "First")
findStringIndex(input: "play", str: "Hello, playground")


