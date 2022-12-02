import Algorithms
import Utils

@main
struct Day1: Exercise {
    let elves: [Elf]
    
    init(input: Input) {
        self.elves = input.rawValue
            .components(separatedBy: "\n\n")
            .map(Elf.init)
    }
    
    var partOne: String {
        elves.max()!.description
    }
    
    var partTwo: String {
        elves.max(count: 3).sum.description
    }
}
