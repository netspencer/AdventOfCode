import Foundation
import Utils

struct Monkey {
    typealias Name = String
    
    enum Value {
        enum Operation {
            case add, subtract, multiply, divide
        }
        
        case int(Int)
        case operation(Name, Operation, Name)
    }
    
    let name: Name
    let value: Value
    
    init(name: Name, value: Value) {
        self.name = name
        self.value = value
    }
    
    var int: Int? {
        switch value {
        case let .int(int):
            return int
        default:
            return nil
        }
    }
    
    var operation: (Name, Monkey.Value.Operation, Name)? {
        switch value {
        case let .operation(left, op, right):
            return (left, op, right)
        default:
            return nil
        }
    }
    
    var isSolved: Bool {
        int != nil
    }
    
    var isNotSolved: Bool {
        !isSolved
    }
}

extension Array where Element == Monkey {
    func solved() -> [Monkey.Name: Int] {
        var solved = reduce(into: [Monkey.Name: Int]()) { solved, monkey in
            if let int = monkey.int {
                solved[monkey.name] = int
            }
        }
        
        var monkeysToSolve = self.filter(\.isNotSolved)
        
        while solved.count < count {
            for monkey in monkeysToSolve {
                guard let operation = monkey.operation else { continue }
                guard let leftMonkeyInt = solved[operation.0] else { continue }
                guard let rightMonkeyInt = solved[operation.2] else { continue }

                solved[monkey.name] = operation.1.solved(leftMonkeyInt, rightMonkeyInt)
            }
        }
        
        return solved
    }
}

extension Monkey.Value.Operation {
    func solved(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .add: return lhs + rhs
        case .subtract: return lhs - rhs
        case .multiply: return lhs * rhs
        case .divide: return lhs / rhs
        }
    }
}
