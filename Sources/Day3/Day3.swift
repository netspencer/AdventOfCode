import Algorithms
import Foundation
import Utils

@main
struct Day3: Exercise {
    let rucksacks: [Rucksack]
    
    init(input: Input) {
        self.rucksacks = input.lines.map(Rucksack.init)
    }
    
    var partOne: String {
        rucksacks
            .map(\.redundantItem)
            .map(\.priority)
            .sum
            .description
    }
    
    var partTwo: String {
        rucksacks
            .chunks(ofCount: 3)
            .map(\.badge)
            .map(\.priority)
            .sum
            .description
    }
}

