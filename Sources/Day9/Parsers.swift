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

extension Direction {
    static func parse(_ input: Substring) -> Direction {
        switch input {
        case "U": return .up
        case "D": return .down
        case "L": return .left
        case "R": return .right
        default: fatalError()
        }
    }
}
