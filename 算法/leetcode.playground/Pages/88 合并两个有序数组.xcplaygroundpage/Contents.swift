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

func merge_2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
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


func merge_3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
    
    if n == 0 {
        return
    }
    
    var array = [Int]()
    
    var newNums1 = [Int]()
    
    var newNums2 = [Int]()
    
    if nums1[0] >= nums1[m-1] {
        for i in 0..<m {
            newNums1.append(nums1[m - 1 - i])
        }
    } else {
        newNums1 = nums1
    }
    
    if nums2[0] >= nums2[n-1] {
        for i in 0..<n {
            newNums2.append(nums2[n - 1 - i])
        }
    } else {
        newNums2 = nums2
    }
    
    var num1Location = 0
    var num2Location = 0
    
    var i = 0
    
    while i<m+n {
        if num1Location < m && num2Location < n{
            if newNums1[num1Location] == newNums2[num2Location] {
                array.append(newNums1[num1Location])
                array.append(newNums2[num2Location])
                num1Location += 1
                num2Location += 1
                i += 2
            } else if newNums1[num1Location] < newNums2[num2Location] {
                array.append(newNums1[num1Location])
                num1Location += 1
                i += 1
            } else {
                array.append(newNums2[num2Location])
                num2Location += 1
                i += 1
            }
        }
        
        if num1Location < m && num2Location >= n {
            array.append(newNums1[num1Location])
            num1Location += 1
            i += 1
        }
        
        if num1Location >= m && num2Location < n {
            array.append(newNums2[num2Location])
            num2Location += 1
            i += 1
        }
    }

    nums1 = array

}

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
    var array = [Int]()
    
    if n == 0 {
        return
    }
    var p = 0 ,q = 0
    while p < m && q < n {
        if nums1[p] < nums2[q] {
            array.append(nums1[p])
            p += 1
        } else {
            array.append(nums2[q])
            q += 1
        }
    }
    
    if m > p {
        for i in p..<m{
            array.append(nums1[i])
        }
    }
    
    if n > q {
        for i in q..<n{
            array.append(nums2[i])
        }
    }
    nums1 = array
    
}

var nums1 = [2,9999,0]

var nums2 = [Int]()

merge_3(&nums1, 2, nums2, 0)
print(nums1)

