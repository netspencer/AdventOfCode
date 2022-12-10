import Algorithms

enum Instruction {
    case noop
    case addx(Int)
}

extension Array where Element == Instruction {
    func toCycles() -> [CPU] {
        flatMap { instruction -> [Int] in
            switch instruction {
            case .noop:
                return [0]
            case let .addx(amount):
                return [0, amount]
            }
        }
        .reductions(1, +)
        .enumerated()
        .map {
            CPU(
                cycle: $0.offset + 1,
                x: $0.element
            )
        }
    }
}
