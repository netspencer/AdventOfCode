import Foundation
import Utils

extension Monkey {
    static func parse(_ input: some StringProtocol) -> Monkey {
        let (name, rest) = input.components(separatedBy: ": ").splat()
        return self.init(
            name: String(name),
            value: .parse(rest)
        )
    }
}

extension Monkey.Value {
    static func parse(_ input: some StringProtocol) -> Monkey.Value {
        if let int = Int(input) {
            return .int(int)
        } else {
            let (left, op, right) = input.components(separatedBy: " ").splat()
            return .operation(left, .parse(op), right)
        }
    }
}

extension Monkey.Value.Operation {
    static func parse(_ input: some StringProtocol) -> Monkey.Value.Operation {
        switch input {
        case "+": return .add
        case "-": return .subtract
        case "*": return .multiply
        case "/": return .divide
        default: fatalError()
        }
    }
}
