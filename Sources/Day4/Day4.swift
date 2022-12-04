import Algorithms
import Foundation
import Utils

@main
struct Day4: Exercise {
    let pairs: [RangePair]
    
    init(input: Input) {
        self.pairs = input.lines
            .map(RangePair.parse)
    }
    
    var partOne: String {
        pairs
            .filter(\.isContained)
            .count
            .description
    }
    
    var partTwo: String {
        pairs
            .filter(\.isOverlapping)
            .count
            .description
    }
}


