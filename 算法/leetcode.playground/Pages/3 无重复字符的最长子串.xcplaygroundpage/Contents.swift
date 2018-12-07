//: [Previous](@previous)

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */


/*实现原理 滑动窗口的形式去实现 如果给一个例子"abcabcbb"，让你手动找无重复字符的子串，该怎么找？一个字符一个字符的遍历，比如a，b，c，
 * 然后又出现了一个a，那么此时就应该去掉第一次出现的a，然后继续往后，又出现了一个b，则应该去掉一次出现的b，以此类推，最终发现最长的
 * 长度为3 我们可以使用HashMap来建立字符和其出现位置之间的映射
 * 用m[256]表示所有字符 ，遍历字符串如果m[s[i]] == 0 （这是说这个字符还没有出现过的意思） m[s[i]] < left （这是说明这个字符串已经出现过）
 * 但是没有在当前的滑动窗口内 此时最大的长度就是  max(res,i-left+1)
 * 如果不是上面两种情况说明 这个字符在滑动窗口中出现过 那么left 移动到这个字符在滑动窗口的位置
 *
 * */
import Foundation


func lengthOfLongestSubstring(_ s: String) -> Int {
    var right = 1
    var left = 0
    var i = 0
    var result = 0
    
    if s.count > 0 {
        result = right - left
        let chars = Array(s.utf8)
        
        //Interate in a incremental window
        while right < chars.count {
            i = left
            while i < right {
                //Check if a duplicate is found
                if chars[i] == chars[right] {
                    left = i + 1
                    break
                }
                i = i + 1
            }
            result = max(result,right-left+1)
            right = right + 1
        }
    }
    return result
}

let result = lengthOfLongestSubstring("abca")

print(result)





