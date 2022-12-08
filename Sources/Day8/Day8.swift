import Algorithms
import Foundation
import Utils

@main
struct Day8: Exercise {
    let forrest: Forrest
    
    init(input: Input) {
        self.forrest = .parse(input)
    }
    
    var partOne: String {
        forrest
            .coordinates
            .filter { forrest.isVisible(at: $0) }
            .count
            .description
    }
    
    var partTwo: String {
        forrest
            .coordinates
            .map { forrest.scenicScore(for: $0) }
            .max()!
            .description
    }
}
