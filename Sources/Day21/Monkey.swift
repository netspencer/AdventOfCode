import Foundation
import Utils

struct Monkey {
    typealias Name = String
    
    enum Value {
        enum Operation {
            case add, subtract, multiply, divide
        }
        
        case number(Double)
        case operation(Name, Operation, Name)
    }
    
    let name: Name
    let value: Value
    
    init(name: Name, value: Value) {
        self.name = name
        self.value = value
    }
    
    var number: Double? {
        switch value {
        case let .number(double):
            return double
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
}

extension Array where Element == Monkey {
    var solved: [Monkey.Name: Double] {
        reduce(into: [Monkey.Name: Double]()) { solved, monkey in
            if let number = monkey.number {
                solved[monkey.name] = number
            }
        }
    }
        
    func rootValue(solved: [Monkey.Name: Double], shouldReturnDifference: Bool) -> Double {
        var solved = solved
        while solved.count < count {
            for monkey in self {
                guard solved[monkey.name] == nil else { continue }
                guard let operation = monkey.operation else { continue }
                guard let leftMonkeyInt = solved[operation.0] else { continue }
                guard let rightMonkeyInt = solved[operation.2] else { continue }
                
                if shouldReturnDifference, monkey.name == "root" {
                    return leftMonkeyInt - rightMonkeyInt
                }
                
                solved[monkey.name] = operation.1.solved(leftMonkeyInt, rightMonkeyInt)
            }
        }
        return solved["root"]!
    }
    
    var rootValue: Int {
        Int(rootValue(solved: solved, shouldReturnDifference: false))
    }

    var humnValue: Int {
        var bounds = 0 ... Int.max-1
        var solved = solved
        
        while bounds.lowerBound != bounds.upperBound {
            let candidate = bounds.lowerBound + (bounds.count / 2)
            solved["humn"] = Double(candidate)
            
            let difference = rootValue(solved: solved, shouldReturnDifference: true)
                                  
            if difference > 0 {
                bounds = candidate ... bounds.upperBound
            } else if difference < 0 {
                bounds = bounds.lowerBound ... candidate
            } else {
                bounds = candidate ... candidate
            }
        }
        
        return bounds.lowerBound
    }
}

extension Monkey.Value.Operation {
    func solved(_ lhs: Double, _ rhs: Double) -> Double {
        switch self {
        case .add: return lhs + rhs
        case .subtract: return lhs - rhs
        case .multiply: return lhs * rhs
        case .divide: return lhs / rhs
        }
    }
}
