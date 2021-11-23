//
//  main.swift
//  linked_list
//
//  Created by joe george on 25/10/21.
//

import Foundation


public class Node<T>{
    var data: T
    var next: Node?
    
    init(_ val: T) {
        self.data = val
        self.next = nil
    }
    
    public func toString() -> String {
        
        if let safeNext = self.next{
            return  "\(self.data) -> \(safeNext.toString())"
        } else {
           return  "\(self.data)"
        }
        
    }
    
}

public class LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    var size: Int = 0
    
    private func isEmpty() -> Bool {
        return self.size == 0
    }
    
    public func toString() -> String {
        if !isEmpty() {
            if let safeHead = self.head {
                return safeHead.toString()
            }
        }
        return "Linked List is empty."
    }
    
    
    // o(1) -> data is added to end position and tail is re-adjusted and if data is nil head and tail will be ajusted to the same data
    func push(_ val: T) {
        let newNode = Node(val)
        if self.head != nil {
            self.tail?.next = newNode
            self.tail = newNode
        } else {
            // if head is nil, head and tail is pointed to the new node
            self.head = newNode
            self.tail = self.head
        }
        self.size += 1
    }
    
    // o(n) -> beacuse we have to traverse the whole list
    func pop() {
        if self.head == nil {
            return
        }  else {
            var temp = self.head
            var prev = self.head
            
            while temp?.next != nil {
                prev = temp
                temp = temp?.next
                
            }
            self.tail = prev
            self.tail?.next = nil
            self.size -= 1
            
            // if list size was one now the size will be zero so head and tail are set to nil
            if self.isEmpty(){
                self.head = nil
                self.tail = nil
            }
        }
         
    }
    
    // o(1) -> appending a new node to the first position
    func unShift(_ val: T) {
        let newNode = Node(val)
        if self.head != nil {
            newNode.next = self.head
            self.head = newNode
        } else {
            // if head is nil, head and tail is pointed to the new node
            self.head = newNode
            self.tail = self.head
        }
        self.size += 1
    }
    
    // o(1) -> removing a node from the first position
    func shift() {
        if self.head != nil  {
            // if linked list contains two or more nodes
            let temp = self.head
            self.head = self.head?.next
            temp?.next = nil
            self.size -= 1
            
            /* if linked list contains one node, after the above
            code the size will be empty so we re-adjust the
            tail to nil and because head is already nil */
            if self.isEmpty(){
                self.tail = nil
            }
        }
        // if head is nil return
        return
    }
    
    // o(n) -> traversing through the list to get the value
    func get(_ index: Int32) -> Node<T>?  {
        // if index is less than zero and greater than length return nil
        if index >= 0 || index < self.size {
            var temp = self.head
            for _ in 0..<index {
                temp = temp?.next
            }
            return temp
        }
        return nil
    }
    
    func set(_ index: Int32, _ value: T) -> Bool {
        if let safeTempVal = self.get(index){
            safeTempVal.data = value
            return true
        }
        return false
    }
    
    
    
}


let dogList = LinkedList<String>()

dogList.push("lab")
dogList.push("bulldog")
dogList.push("husky")
dogList.unShift("german sheperd")
dogList.shift()
let isSet: Bool = dogList.set(010, "beagle")

//if let safeVal = dogList.get(0){
//    print(safeVal.data)
//}



print(dogList.toString())










