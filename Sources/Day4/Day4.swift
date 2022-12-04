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
            .map(\.oneFullyContainsOther.intValue)
            .sum
            .description
    }
    
    var partTwo: String {
        pairs
            .map(\.oneOverlapsOther.intValue)
            .sum
            .description
    }
}


