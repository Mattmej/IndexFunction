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
    
    /*
     ==========================
     Creating the Dictionary
     ==========================
     */
    
    
    
    // Set the smallest index number to the length of the string.
    // This statement is to ensure that the starting "smallestNum" is bigger than any of the characters' indices.
    var smallestNum: Int = str.count
    
    /* ========= */
    /* !!! NOTE: At this point, the inputted string and charCollection are the same. !!! */
    /* ========= */

    
    // If the input string is inside the original string, then...
    if isInStr(input: input, str: str) {
        
        // Create an empty dictionary to hold each of the characters in the input string
        var dictionary: [String:[Int]] = [:]
        
        // For every character inside our charCollection (our input string)
        for character in charCollection {

            // This variable will hold the indices of original string.
            // We will compare the charCollection's characters against the originalStr's characters.
            let index = originalStr.index(of: character)?.encodedOffset
            
//            dictionary[String(character)] = Int(originalStr.index(of: character))
            
            
            // Set the dictionary's value for the character in charCollection to its index in the original string.
            dictionary[String(character)] = index
            
        }
        
        print(dictionary)
        
        
        /* =================================================== */
        
        
        /*
        ==========================
        Finding the smallest index from the inputted string
        ==========================
        */
        
        
        
        // Create an array from the keys in the dictionary.
        var keyArray = Array(dictionary.keys)
        
        // Loop through the dictionary's keys
        for i in 0..<dictionary.count {
            
//            smallestNum = (dictionary[keyArray[i]])!

            // Set a value equal to the current character's value in the dictionary.
            var value: Int = (dictionary[keyArray[i]])!

            // If the smallestNum is bigger than the value, set the smallestNum equal to the value.
            if smallestNum > value {
                print("Old value = \(smallestNum)")
                smallestNum = value
                print("New value = \(smallestNum)")
            }

            // Otherwise, continue looping.
            else {
                continue
            }
            print(smallestNum)
        }
        
        // At the end, return the smallestNum.
        return smallestNum
    }
    
    // If the inputted string is NOT in the original string, return an index of -1.
    else {
        return -1
    }
}

func findSmallestIndexFromArray(array: [Int]) -> Int {
    if array.count == 1 {
        return array[0]
    }
    
    else {
        var smallest = array[0]
        for i in 0..<array.count-1 {
//            let smallest = array[i]
            let nextVal = array[i+1]
            if (smallest > nextVal) {
                smallest == nextVal
            }
            
            else {
                continue
            }
        }
        
        return smallest
    }
}




//findStringIndex(input: "sss", str: "First")
//findStringIndex(input: "rfi", str: "First")
findStringIndex(input: "play", str: "Hello, playground")


