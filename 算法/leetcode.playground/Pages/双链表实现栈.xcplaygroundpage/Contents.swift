//: [Previous](@previous)

import Foundation

public class ListNode<T:Comparable> {
    public var data:T          //数据
    public var next: ListNode? //后指针
    public var pre: ListNode?  //前指针
    
    public init (_ data:T){
        self.data = data
        self.next = nil
        self.pre = nil
    }
}

//extension ListNode {
//    func isEquals<T: Comparable>(_ a: T) -> Bool {
//        return (self.data == a)
//    }
//}

var root:ListNode<Int>?

func addOne<T>(root:ListNode<T>?,data:T) -> ListNode<T>?{
    if root == nil {
        return ListNode.init(data)
    } else {
        let newNode = ListNode.init(data)
        newNode.next = root
        root!.pre = newNode
        return newNode
    }
}

func printDoubleList<T>(_ root:ListNode<T>?) {
    if root != nil {
        var temp  = root
        while temp != nil {
            print(temp!.data)
            temp = temp!.next
        }
    }
}

func delete<T> (_ root:ListNode<T>? ,data:T) -> ListNode<T>?{
    if root != nil {
        let head = ListNode.init(data)
        head.next = root
        root!.pre = head
        var temp = root
      
      
    }
    return nil
}


root = addOne(root: root, data: 100)

root = addOne(root: root, data: 200)

root = addOne(root: root, data: 300)
root = addOne(root: root, data: 100)
root = addOne(root: root, data: 300)

root = addOne(root: root, data: 200)

printDoubleList(root)


delete(root, data: 200)

print("删除后的链表")

printDoubleList(root)
