import Algorithms
import Foundation
import Utils

struct Rope {
    var knots: Array<Position>
    var tailVisits: Set<Position>

    init(length: Int) {
        self.knots = Array(repeating: Position.zero, count: length)
        self.tailVisits = [.zero]
    }
    
    mutating func execute(_ instruction: Instruction) {
        for _ in 1...instruction.steps {
            knots.head.move(direction: instruction.direction)
            
            for (previousIndex, index) in knots.indices.adjacentPairs() {
                knots[index].move(towards: knots[previousIndex])
            }
            
            tailVisits.insert(knots.tail)
        }
    }
}
