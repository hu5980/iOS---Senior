
import Foundation

var str = "Hello, playground"

func isPalindrome_1(_ x: Int) -> Bool {
    func reverseInt(_ x: Int) -> Int {
        var remain = x
        var result = 0
        while remain > 0 {
            result = result * 10 + remain % 10
            remain /= 10
        }
        return result
    }
    
    if x < 0 || x != reverseInt(x) {
        return false
    }
    return true
}

func isPalindrome(_ x: Int) -> Bool {
    if x >= 0 {
        var tempX  = x
    
        var tempArr = [Int]()
        while tempX != 0 {
            tempArr.append(tempX % 10)
            tempX /= 10
        }
        
        for i in 0..<tempArr.count / 2 {
            if tempArr[i] != tempArr[tempArr.count - i - 1] {
                return false
            }
            
        }
        return true
    }
    return false
}




isPalindrome_1(12321)
