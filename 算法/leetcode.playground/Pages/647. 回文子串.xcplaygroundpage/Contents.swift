//: [Previous](@previous)

import Foundation
/*
 给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
 
 具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被计为是不同的子串。
 
 示例 1:
 
 输入: "abc"
 输出: 3
 解释: 三个回文子串: "a", "b", "c".
 示例 2:
 
 输入: "aaa"
 输出: 6
 说明: 6个回文子串: "a", "a", "a", "aa", "aa", "aaa".
 注意:
 
 输入的字符串长度不会超过1000。
 
 */


func countSubstrings(_ s: String) -> Int {
    var count = 0
    var str = [Character]()
    
    for c in s {
        str.append(c)
    }
    
    func extend(_ str:[Character], left:Int,right:Int) {
        var tempLeft = left
        var temoRight = right
        while (tempLeft >= 0 && temoRight < str.count && str[tempLeft] == str[temoRight]) {
            count += 1
            tempLeft -= 1
            temoRight += 1
        }
    }
    
    for index in 0..<str.count {
         extend(str, left:index, right: index)
         extend(str, left:index, right: index+1)
    }
    
    return count
}

let result = countSubstrings("agugjhgygujhguy")
print(result)
