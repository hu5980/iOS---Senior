//: [Previous](@previous)

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var root:ListNode?

func addOne(_ root :ListNode? ,node:Int) -> ListNode? {
    if root == nil {
        return ListNode.init(node)
    }else{
        let newNode = ListNode.init(node)
        newNode.next = root
        return newNode
    }
}

func printList(_ root :ListNode?) {
    if root != nil {
        var temp  = root
        while temp != nil {
            print(temp!.val)
            temp = temp!.next
        }
    }
}

var test = [1,2,3]

func add() {
    for i in 0..<test.count {
        root = addOne(root, node: test.reversed()[i])
        
    }
}


func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
  
    if head != nil {
        let root = ListNode.init(0)
        root.next = head
        var p = root
        while p.next != nil {
            if p.next!.val == val {
                p.next = p.next!.next
            } else {
                p = p.next!
            }
        }
        return root.next
    }
    return head
}


func reverseList(_ head: ListNode?) -> ListNode? {
    
    func addNewOne(_ root :ListNode? ,node:Int) -> ListNode? {
        if root == nil {
            return ListNode.init(node)
        }else{
            let newNode = ListNode.init(node)
            newNode.next = root
            return newNode
        }
    }
    
    var temp = head
    var newRoot:ListNode?
    while temp != nil {
        newRoot = addNewOne(newRoot, node: temp!.val)
        temp = temp!.next
    }

    return newRoot
}

func reverseList_1(_ head: ListNode?) -> ListNode? {
    var temp = head
    var p:ListNode?
    var next:ListNode?
    
    while temp != nil {
        
        p = temp!.next
     //   print("p.val = \(p?.val) ")
        temp!.next = next
     //   print("next.val = \(next?.val) ")
        next = temp
     //   print("next.val = \(next?.val) ")
        temp = p
      //  print("temp.val = \(temp?.val) \n")
    }

    return next
}




add()



root = reverseList_1(root)
printList(root)




