import Algorithms
import Foundation
import Collections
import Utils

@main
struct Day18: Exercise {
    let volcano: Volcano
    
    init(input: Input) {
        self.volcano = .parse(input)
    }
    
    var partOne: String {
        volcano.surfaceArea.description
    }
}
