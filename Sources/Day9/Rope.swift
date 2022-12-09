import Algorithms
import Foundation
import Utils

struct Rope {
    var knots: Array<Knot>
    var tailVisits: Set<Knot>

    init(length: Int) {
        self.knots = Array(repeating: Knot.zero, count: length)
        self.tailVisits = [knots.tail]
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
