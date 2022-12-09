import Algorithms
import Foundation
import Utils

@main
struct Day9: Exercise {
    let instructions: [Instruction]
    
    init(input: Input) {
        self.instructions = input.lines.map(Instruction.parse)
    }
    
    var partOne: String {
        visitsForRope(ofLength: 2)
            .description
    }
    
    var partTwo: String {
        visitsForRope(ofLength: 10)
            .description
    }
    
    func visitsForRope(ofLength length: Int) -> Int {
        instructions
            .reduce(into: Rope(ropeLength: length)) { $0.execute($1) }
            .tailVisits
            .count
    }
}
