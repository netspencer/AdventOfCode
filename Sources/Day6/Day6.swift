import Algorithms
import Foundation
import Utils

@main
struct Day6: Exercise {
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var partOne: String {
        input.rawValue
            .firstUniqueSubsequence(length: 4)!
            .description
    }
    
    var partTwo: String {
        input.rawValue
            .firstUniqueSubsequence(length: 14)!
            .description
    }
}
