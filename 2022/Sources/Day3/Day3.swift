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
            .map { $0.map(Rucksack.init) }
            .map(ElfGroup.init(rucksacks:))
            .map(\.priority)
            .sum
            .description
    }
}

