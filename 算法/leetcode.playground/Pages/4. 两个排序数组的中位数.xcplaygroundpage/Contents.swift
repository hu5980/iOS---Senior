//: [Previous](@previous)

import Foundation

/*
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2 。
 
 请找出这两个有序数组的中位数。要求算法的时间复杂度为 O(log (m+n)) 。
 
 你可以假设 nums1 和 nums2 不同时为空。
 
 示例 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 中位数是 2.0
 示例 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 中位数是 (2 + 3)/2 = 2.5
 */

// 耗时间特别长
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var longNums = nums1.count > nums2.count ? nums1 : nums2
    var shortNums = nums1.count > nums2.count ? nums2 : nums1
    for i in 0..<shortNums.count {
        let temp = shortNums[i]
        for j in 0..<longNums.count {
            if longNums[j] >= temp {
                longNums.insert(temp, at: j)
            } else {
                if  longNums.last! < temp{
                    longNums.insert(temp, at: longNums.count)
                }else {
                    continue
                }
            }
            break
        }
    }
    
    print(longNums)
    if longNums.count % 2 == 0 {
        return (Double(longNums[longNums.count / 2]) + Double(longNums[longNums.count / 2 - 1])) / 2.0
    } else {
       return Double(longNums[longNums.count / 2])
    }
}


let result = findMedianSortedArrays([0,0,0,1,2,3], [2,5,6])

print(result)

