import Foundation
import Collections

class Node: NSObject {
    var value: Int
    var next: Node?
    var previous: Node?
    
    init(value: Int, next: Node? = nil, previous: Node? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
        
    static func fromArray(_ array: [Int]) -> Node {
        var head: Node?
        var current: Node?
        
        for int in array {
            let node = Node(value: int)
            
            if let c = current {
                current!.next = node
                node.previous = c
                current = node
            } else {
                current = node
                head = node
            }
        }
        
        // make it a loop
        current!.next = head
        head!.previous = current
        
        return head!
    }
        
    func asQueue() -> Deque<Node> {
        let head = self
        var queue = Deque([self])
        
        guard var runner = next else { return queue }
        while runner != head {
            queue.append(runner)
            runner = runner.next!
        }
        
        return queue
    }
    
    func shiftForward() {
        let initialNext = next!
        let initialPrevious = previous!
        
        next = initialNext.next
        initialNext.next!.previous = self
        initialNext.next = self
        
        previous = initialNext
        initialPrevious.next = initialNext
        initialNext.previous = initialPrevious
    }
    
    func shiftForward(times: Int) {
        for _ in 1 ... times {
            shiftForward()
        }
    }
    
    func shiftBackward() {
        let initialNext = next!
        let initialPrevious = previous!
        
        previous = initialPrevious.previous
        initialPrevious.previous!.next = self
        initialPrevious.previous = self
        
        next = initialPrevious
        initialNext.previous = initialPrevious
        initialPrevious.next = initialNext
    }
    
    func shiftBackward(times: Int) {
        for _ in 1 ... times {
            shiftBackward()
        }
    }
    
    var groveCoordinates: [Int] {
        var coordinates = [Int]()
        
        var count = 0
        var hasSeenZero = false
        var current = self
        
        while count <= 3000 {
            current = current.next!
            
            if hasSeenZero { count += 1 }
            
            if hasSeenZero, count % 1000 == 0 {
                coordinates.append(current.value)
            }
            
            if !hasSeenZero, current.value == 0 {
                hasSeenZero = true
            }
        }
        
        return coordinates
    }
}

extension Deque<Node> {
    func mix() {
        var queue = self
        
        while let current = queue.popFirst() {
            if current.value == 0 {
                continue
            } else if current.value < 0 {
                let moves = (-current.value).quotientAndRemainder(dividingBy: count - 1).remainder
                guard moves != 0 else { continue }
                current.shiftBackward(times: moves)
            } else {
                let moves = (current.value).quotientAndRemainder(dividingBy: count - 1).remainder
                guard moves != 0 else { continue }
                current.shiftForward(times: moves)
            }
        }
    }
    
    func mix(times: Int) {
        for _ in 1 ... times {
            mix()
        }
    }
}
