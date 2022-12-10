import Foundation
import Utils

extension Instruction {
    static func parse(_ input: String) -> Instruction {
        let parts = input.split(separator: " ")
        switch parts[0] {
        case "noop":
            return .noop
        case "addx":
            return .addx(Int(parts[1])!)
        default:
            fatalError()
        }
    }
}
