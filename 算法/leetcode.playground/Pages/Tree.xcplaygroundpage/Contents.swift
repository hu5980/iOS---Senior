//: [Previous](@previous)

import Foundation


class TreeNode {
    var value:Int
    var left:TreeNode?
    var right:TreeNode?

    init(_ value:Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}


var root:TreeNode?
var size:Int = 0



func addOne(root:TreeNode?,node:Int) -> TreeNode?{
    if root == nil {
        size += 1
        return TreeNode.init(node)
    }
    if node < (root?.value)! {
        size += 1
        root?.left = addOne(root: root?.left, node: node)
    } else if node > (root?.value)!{
        size += 1
        root?.right = addOne(root: root?.right, node: node)
    }
    return root
}

func add(node:Int) {
    root = addOne(root: root, node: node)

}

var a = [4,5,9,11,2,1,3,14,13,8]

for index in 0..<a.count {
    add(node: a[index])
}



func sequenceTraversal(root:TreeNode?)  {
    if root != nil {
        print("\(root!.value)")
        sequenceTraversal(root: root?.left)
        sequenceTraversal(root: root?.right)
    }
}
sequenceTraversal(root: root)


func middleTraversal(root:TreeNode?) {
    if root != nil {
        middleTraversal(root: root?.left)
        print(root?.value)
        middleTraversal(root: root?.right)
    }
}
middleTraversal(root: root)


func afterTraversal(root:TreeNode?) ->[Int] {
    
    var after = [Int]()
    
    func afterTraversal(root:TreeNode?) {
        if root != nil {
            afterTraversal(root: root?.left)
            afterTraversal(root: root?.right)
            after.append(root!.value)
        }
    }
    
    afterTraversal(root: root)
    return after
}




