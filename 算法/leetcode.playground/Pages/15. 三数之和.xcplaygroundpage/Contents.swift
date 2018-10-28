//: [Previous](@previous)

import Foundation

func threeSum_1(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for m in j+1..<nums.count {
                if nums[i] + nums[j] + nums[m] == 0 {
                    let num = [nums[i],nums[j],nums[m]].sorted()
                    if !result.contains(num){
                        result.append(num)
                    }
                }
            }
        }
    }
    return result
}




func threeSum_2(_ nums: [Int]) -> [[Int]] {
    
    if nums.count < 3 {
        return [[Int]]()
    } else {
        
        var result = [[Int]]()
        
        let newNums = nums.sorted()
        
        let target = 0
        var _ = 0,b = 0,c = 0
        
        for a in 0..<newNums.count-2 {
            b = a+1
            c = newNums.count - 1
            if (a > 0 && newNums[a] == newNums[a-1]) {
                continue
            }
            
            if (newNums[a] + newNums[a+1] + newNums[a+2] > target) {
                break
            }
            
            if (newNums[a] + newNums[c] + newNums[c-1] < target) {
                continue
            }
            
            while b < c {
                let sum = newNums[a] + newNums[b] + newNums[c];
                if(sum<target){
                    repeat {
                        b += 1
                    }while(b<c && newNums[b] == newNums[b-1])
                }else if(sum>target){
                    repeat {
                        c -= 1
                    }while(b<c && newNums[c] == newNums[c+1])
                }else{
                    result.append([newNums[a],newNums[b],newNums[c]])
                    repeat {
                        c -= 1
                    }while(b<c && newNums[c] == newNums[c+1])
                    
                    repeat {
                        b += 1
                    }while(b<c && newNums[b] == newNums[b-1])
                }
            }
        }
        return result
    }
    
}

func threeSum_3(_ nums: [Int]) -> [[Int]] {
    
    let nums = nums.sorted()
    var result = [[Int]]()
    
    
    for i in 0..<nums.count{
        if nums[i] > 0 {break}
        if i>0 && nums[i] == nums[i - 1] { continue } 
        
        let target = 0 - nums[i]
        var m = i + 1, n = nums.count - 1
        
        while m < n {
            if nums[m] + nums[n] == target {
                result.append([nums[i], nums[m], nums[n]])
                while m < n && nums[m] == nums[m + 1] {
                    m = m + 1
                }
                while m < n && nums[n] == nums[n - 1] {
                    n = n - 1
                }
                m = m + 1
                n = n - 1
            }else if(nums[m] + nums[n] < target) {
                m = m + 1
            }else{
                n = n - 1
            }
        }
    }
    
    return result
}

let result1 = threeSum_2([13,14,1,2,-11,-11,-1,5,-1,-11,-9,-12,5,-3,-7,-4,-12,-9,8,-13,-8,2,-6,8,11,7,7,-6,8,-9,0,6,13,-14,-15,9,12,-9,-9,-4,-4,-3,-9,-14,9,-8,-11,13,-10,13,-15,-11,0,-14,5,-4,0,-3,-3,-7,-4,12,14,-14,5,7,10,-5,13,-14,-2,-6,-9,5,-12,7,4,-8,5,1,-10,-3,5,6,-9,-5,9,6,0,14,-15,11,11,6,4,-6,-10,-1,4,-11,-8,-13,-10,-2,-1,-7,-9,10,-7,3,-4,-2,8,-13])

print(result1)

let result = threeSum_3([13,14,1,2,-11,-11,-1,5,-1,-11,-9,-12,5,-3,-7,-4,-12,-9,8,-13,-8,2,-6,8,11,7,7,-6,8,-9,0,6,13,-14,-15,9,12,-9,-9,-4,-4,-3,-9,-14,9,-8,-11,13,-10,13,-15,-11,0,-14,5,-4,0,-3,-3,-7,-4,12,14,-14,5,7,10,-5,13,-14,-2,-6,-9,5,-12,7,4,-8,5,1,-10,-3,5,6,-9,-5,9,6,0,14,-15,11,11,6,4,-6,-10,-1,4,-11,-8,-13,-10,-2,-1,-7,-9,10,-7,3,-4,-2,8,-13])

print(result)







