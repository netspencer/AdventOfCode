import Algorithms
import Foundation
import Utils

@main
struct Day3: Exercise {
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var partOne: String {
        input.lines
            .map(Rucksack.init)
            .map(\.priority)
            .sum
            .description
    }
    
    var partTwo: String {
        input.lines
            .chunks(ofCount: 3)
            .map { Group(rucksacks: $0.map(Rucksack.init)) }
            .map(\.priority)
            .sum
            .description
    }
}

