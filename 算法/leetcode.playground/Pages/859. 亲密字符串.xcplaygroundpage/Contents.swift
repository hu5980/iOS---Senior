//: [Previous](@previous)

import Foundation
/*
 给定两个由小写字母构成的字符串 A 和 B ，只要我们可以通过交换 A 中的两个字母得到与 B 相等的结果，就返回 true ；否则返回 false 。
 
 示例 1：
 
 输入： A = "ab", B = "ba"
 输出： true
 示例 2：
 
 输入： A = "ab", B = "ab"
 输出： false
 示例 3:
 
 输入： A = "aa", B = "aa"
 输出： true
 示例 4：
 
 输入： A = "aaaaaaabc", B = "aaaaaaacb"
 输出： true
 示例 5：
 
 输入： A = "", B = "aa"
 输出： false
 
 
 提示：
 
 0 <= A.length <= 20000
 0 <= B.length <= 20000
 A 和 B 仅由小写字母构成。
 */



var str = "Hello"


func buddyStrings(_ A: String, _ B: String) -> Bool {
    
    func getchar(_ A: String ,_ index:Int) -> Character {
        return A[A.index(A.startIndex, offsetBy: index)]
    }
    
    //首先判断A ，B 字符串的个数必须都大于等于2。并且A，B字符串的长度必须相等 否则返回false
    if A.count < 2 || B.count < 2 || A.count != B.count {
        return false
    }
    
    if A == B {
        for i in 0..<A.count {
            let tempA =  getchar(A, i)
            for  j in 0..<A.count {
                if i == j {
                    continue
                } else {
                    let tempB = getchar(A, j)
                    if tempA == tempB {
                        return true
                    }
                }
            }
        }
    } else {
        var first = -1, second = -1
        for i in 0..<A.count {
            if (getchar(A, i) != getchar(B, i)) {
                if (first == -1){
                    first = i
                } else if (second == -1){
                    second = i;
                } else {
                    return false
                }
            }
        }
        
        return (second != -1 && getchar(A, first) == getchar(B, second) &&
            getchar(A, second) == getchar(B, first));
    }
    return false
}

let result = buddyStrings("abacdefga", "abacdefga")

print(result)





