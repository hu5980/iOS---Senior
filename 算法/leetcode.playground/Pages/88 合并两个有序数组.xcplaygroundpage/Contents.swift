//: [Previous](@previous)

import Foundation

//: [Next](@next)

func merge_1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var newNums = [Int]()
    
    for i in 0..<m {
            newNums.append(nums1[i])
    }
    
    for i in 0..<n {
        newNums.append(nums2[i])
    }
    newNums.sort()
    nums1 = newNums
}

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
    // 方法二
    var end = nums1.count - 1
    var m = m - 1, n = n - 1
    while m >= 0 && n >= 0 {
        if nums1[m] > nums2[n] {
            nums1[end] = nums1[m]
            end -= 1
            m -= 1
        } else {
            nums1[end] = nums2[n]
            end -= 1
            n -= 1
        }
    }
    while n >= 0 {
        nums1[end] = nums2[n]
        end -= 1
        n -= 1
    }
    return
}

var nums1 = [1,2,3,4,1]

var nums2 = [4,5,6,10,0]

merge_1(&nums1, 2, nums2, 5)
print(nums1)

