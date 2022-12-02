import Algorithms
import Utils

@main
struct Day1: Exercise {
    let calorieCounts: [Int]
    
    init(input: Input) {
        self.calorieCounts = input.rawValue
            .components(separatedBy: "\n\n")
            .map { elf in
                elf
                    .split(separator: "\n")
                    .compactMap { Int($0) }
                    .sum
            }
    }
    
    var partOne: String {
        calorieCounts.max()!.description
    }
    
    var partTwo: String {
        calorieCounts.max(count: 3).sum.description
    }
}
