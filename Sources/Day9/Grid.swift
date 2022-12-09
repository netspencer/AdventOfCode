import Algorithms
import Foundation
import Utils

struct Grid {
    var headPosition: Position = .zero
    var tailPositions: Array<Position>
    
    var tailVisits: Set<Position> = [.zero]

    init(ropeLength: Int) {
        self.tailPositions = Array(repeating: Position.zero, count: ropeLength)
    }
    
    mutating func execute(_ instruction: Instruction) {
        for _ in 1...instruction.steps {
            tailPositions[0].move(direction: instruction.direction)
            
            for (previousIndex, index) in tailPositions.indices.adjacentPairs() {
                tailPositions[index].move(towards: tailPositions[previousIndex])
            }
            
            tailVisits.insert(tailPositions.last!)
        }
    }
}
