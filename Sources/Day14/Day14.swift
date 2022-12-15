import Algorithms
import Foundation
import Utils

@main
struct Day14: Exercise {
    let cave: Cave
    
    init(input: Input) {
        self.cave = Cave.parse(input)
    }
    
    var partOne: String {
        cave.filledWithSand().sand.count.description
    }
    
    var partTwo: String {
        cave.filledWithSand(isEndlessVoid: false).sand.count.description
    }
}
