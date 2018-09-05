//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count
    
    var dic = [Int : Int]()
    
    for i in 0..<count {
        dic[nums[i]] = i
    }
    for i in 0..<count {
        let found = target - nums[i]
        if let j = dic[found], i != j {
            return [i, j]
        }
    }
    return []
}

let nums  = twoSum([1,4,8,15], 16)
print(nums)

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count != 0 else {return 0}
    var max = 0
    var profit = [Int]()
    for i in 0..<prices.count - 1{
       profit.append(prices[i+1] - prices[i])
    }
    for i in 0..<profit.count {
        if profit[i] > 0 {
            max += profit[i]
        }
    }
    return max
}

print(maxProfit([7]))


