//: [Previous](@previous)

import Foundation



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {

    var tree = [[Int]]()
    
    var layer = 0
    
    var tempArr = [TreeNode]()
    
    if root != nil {
        var temp = [root!.val]
        tree.append(temp)
        if root?.left != nil {
            tempArr.append(root?.left)
        }
        
        if root?.right != nil {
            tempArr.append(root?.right)
        }
    }
    
    
    
    
    for x
    
    
    
    
    return tree
}

zigzagLevelOrder
