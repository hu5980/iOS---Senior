//: [Previous](@previous)

import Foundation

func reverseWords(_ s: String) -> String {
    
    func reverseString(_ s: String) -> String {
        
        var startIndex = 0
        var endIndex = s.count-1
        var array = s.cString(using:.utf8)!
        while startIndex<endIndex {
            let char = array[startIndex]
            array[startIndex] = array[endIndex]
            array[endIndex] = char
            startIndex+=1
            endIndex-=1
        }
        return String.init(utf8String: array)!
    }
    
    let array =  s.components(separatedBy: " ")
    var resultArray = [String]()
    for i in 0..<array.count {
        resultArray.append(reverseString(array[i]))
    }
    let result =  resultArray.joined(separator: " ")
    return result
}

let result = reverseWords("A man, a plan, a canal")


