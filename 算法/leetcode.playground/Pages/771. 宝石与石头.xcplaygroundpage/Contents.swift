//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    
    var num = 0
    
    var Jarr = [Character](J)

    for c in S {
        if Jarr.contains(c) {
            num += 1
        }
    }
    return num
}

numJewelsInStones("JHasd", "aasghJHs")
