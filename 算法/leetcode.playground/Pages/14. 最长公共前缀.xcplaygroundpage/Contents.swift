//: [Previous](@previous)

import Foundation


func longestCommonPrefix(_ strs: [String]) -> String {
    
    func getchar(_ A: String ,_ index:Int) -> Character {
        return A[A.index(A.startIndex, offsetBy: index)]
    }
    
    func getSubString(_ A: String ,_ index:Int) -> String {
        let startIndex = A.startIndex
        let endInedx = A.index(startIndex, offsetBy: index)
        return String(A[startIndex ..< endInedx])
    }
    
    let str = ""
    
    if strs.count > 1 {
        for i in 0..<strs[0].count {
            for j in 0..<strs.count {
                if strs[j].count > i {
                    if getchar(strs[j], i) != getchar(strs[0], i){
                        return getSubString(strs[0], i)
                    }
                } else {
                    return getSubString(strs[0], i)
                }
            }
        }
        return strs[0]
    } else if strs.count == 1{
        return strs[0]
    }
    
    return str
}

/*
    思路分析：
    从第一个字符串开始，遍历所有数组中的字符串，看是否是从这个字符串开始，
    如果遍历完有不满足的 则将这个字符串的后面一个字符去掉 ，继续遍历
 
 */

func longestCommonPrefix_1(_ strs: [String]) -> String {
   let count = strs.count
    if count == 0 {
        return ""
    } else if count == 1 {
        return strs[0]
    } else {
        var prefix = strs[0]
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                prefix = String(prefix.prefix(prefix.count - 1))
            }
        }
        if prefix.count == 0 {
            return ""
        }
        return prefix
    }
}

let result = longestCommonPrefix_1(["aac","aa","aa"])

print(result)
