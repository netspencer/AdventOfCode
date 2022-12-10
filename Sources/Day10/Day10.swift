import Algorithms
import Foundation
import Utils

@main
struct Day10: Exercise {
    let cycles: [CPU]
    
    init(input: Input) {
        self.cycles = input.lines.map(Instruction.parse).toCycles()
    }
    
    var partOne: String {
        cycles
            .filter { ($0.cycle - 20) % 40 == 0 }
            .prefix(6)
            .map(\.signalStrength)
            .sum
            .description
    }
    
    var partTwo: String {
        ["\n"] + cycles
            .chunks(ofCount: 40)
            .prefix(6)
            .map { String($0.map(\.pixel)) }
            .joined(separator: "\n")
    }
}

