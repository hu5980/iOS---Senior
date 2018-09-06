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
func findMedianSortedArrays_1(_ nums1: [Int], _ nums2: [Int]) -> Double {
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

func findMedianSortedArrays_2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let nums1Count = nums1.count
    let nums2Count = nums2.count
    var newArray: [Int] = []
    
    let count = nums1Count + nums2Count
    // 2 3 4 5 6
    // 1 1 2 2 3
    let helf = count / 2
    var index1 = 0
    var index2 = 0
    var lastSecondValue: Int = 0
    var lastValue: Int = 0 {
        willSet {
            lastSecondValue = lastValue
        }
    }
    
    while (index1 + index2 <= helf) && (index1 < nums1Count || index2 < nums2Count) {
         print("index1 \(index1)")
         print("index2 \(index2)\n")
        if index1 >= nums1Count {
            lastValue = nums2[index2]
            index2 += 1
            continue
        }
        
        if index2 >= nums2Count {
            lastValue = nums1[index1]
            index1 += 1
            continue
        }
        
        if nums1[index1] <= nums2[index2]  {
            lastValue = nums1[index1]
            index1 += 1
        } else {
            lastValue = nums2[index2]
            index2 += 1
        }
    }
    
    if count & 1 == 1 {
        return Double(lastValue)
    } else {
        return Double(lastValue + lastSecondValue)/2
    }
}

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var A = nums1
    var B = nums2
    
    var m = A.count
    var n = B.count
    
    if m > n {
        swap(&m, &n)
        swap(&A, &B)
    }
   
    var iMin = 0,iMax = m,halfLen = (m + n + 1) / 2
    
    while iMin <= iMax {
        let i = (iMin + iMax) / 2
        let j = halfLen - i
        if (i < iMax && B[j-1] > A[i]){
            iMin = i + 1; // i is too small
        }
        else if (i > iMin && A[i-1] > B[j]) {
            iMax = i - 1; // i is too big
        }
        else { // i is perfect

            var maxLeft = 0.0;
            if (i == 0) { maxLeft = Double(B[j-1]); }
            else if (j == 0) { maxLeft = Double(A[i-1]); }
                
            else { maxLeft = Double([A[i-1],B[j-1]].max()!); }
            if ( (m + n) % 2 == 1 ) { return maxLeft; }
            
            var minRight = 0.0;
            if (i == m) { minRight = Double(B[j]); }
            else if (j == n) { minRight = Double(A[i]); }
            else { minRight = Double([B[j], A[i]].min()!); }
            
            return Double(maxLeft + minRight) / 2.0;
        }
    }

    return 0
}


let result = findMedianSortedArrays_2([1,2,3,4,5], [2,5,6])

print(result)

