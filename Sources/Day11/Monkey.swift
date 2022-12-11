import Foundation
import Utils

struct Monkey {
    var items: [WorryLevel]
    
    let operation: Operation
    let test: Int
    let monkeyIfTrue: MonkeyNumber
    let monkeyIfFalse: MonkeyNumber
    
    var inspectionCount: Int = 0
        
    init(
        items: [WorryLevel],
        operation: @escaping Operation,
        test: Int,
        monkeyIfTrue: MonkeyNumber,
        monkeyIfFalse: MonkeyNumber
    ) {
        self.items = items
        self.operation = operation
        self.test = test
        self.monkeyIfTrue = monkeyIfTrue
        self.monkeyIfFalse = monkeyIfFalse
    }
    
    func throwToMonkey(_ item: WorryLevel) -> MonkeyNumber {
        item.isMultiple(of: test) ? monkeyIfTrue : monkeyIfFalse
    }
    
    mutating func inspectItem(reduceWorry: (Int) -> Int) -> (WorryLevel, MonkeyNumber)? {
        guard !items.isEmpty else { return nil }
        inspectionCount += 1
        var item = items.removeFirst()
        item = operation(item)
        item = reduceWorry(item)
        return (item, throwToMonkey(item))
    }
    
    mutating func catchItem(_ item: WorryLevel) {
        items.append(item)
    }
}

extension Monkey: Equatable, Comparable {
    static func == (lhs: Monkey, rhs: Monkey) -> Bool {
        lhs.items == rhs.items && lhs.inspectionCount == rhs.inspectionCount
    }
    
    static func < (lhs: Monkey, rhs: Monkey) -> Bool {
        lhs.inspectionCount < rhs.inspectionCount
    }
}

typealias WorryLevel = Int
typealias MonkeyNumber = Int

typealias Operation = (Int) -> Int

enum Operations {
    static let cube: Operation = { old in old * old }
    static func add(_ number: Int) -> Operation {
        { old in old + number }
    }
    static func multiply(_ number: Int) -> Operation {
        { old in old * number }
    }
}
