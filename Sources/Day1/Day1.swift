import Algorithms
import Utils

@main
struct Day1: Exercise {
    let elves: [Elf]
    
    init(input: Input) {
        self.elves = input.rawValue
            .components(separatedBy: "\n\n")
            .map(Elf.parse)
    }
    
    /// the totalCalories held by the elf with the most totalCalories
    var partOne: String {
        let topElf = elves.max()!
        return topElf.totalCalories.description
    }
    
    /// the combined number of calories held by the elves with the top three most totalCalories
    var partTwo: String {
        let topThreeElves = elves.max(count: 3)
        return topThreeElves.map(\.totalCalories).sum.description
    }
}
