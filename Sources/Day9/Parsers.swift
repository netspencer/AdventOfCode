import Foundation
import Utils

extension Instruction {
    static func parse(_ input: String) -> Instruction {
        let (directionInput, stepsInput) = input.split(separator: " ").splat()
        return self.init(
            direction: .parse(directionInput),
            steps: Int(stepsInput)!
        )
    }
}

extension Instruction.Direction {
    static func parse(_ input: Substring) -> Instruction.Direction {
        switch input {
        case "U": return .up
        case "D": return .down
        case "L": return .left
        case "R": return .right
        default: fatalError()
        }
    }
}
