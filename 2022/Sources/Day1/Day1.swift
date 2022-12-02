import Algorithms
import ArgumentParser
import Utils
import Foundation

@main
struct Day1: ParsableCommand {
    func run() throws {
        let input = Input()
        
        let calorieCounts = input.rawValue
            .components(separatedBy: "\n\n")
            .map { elf in
                elf
                    .split(separator: "\n")
                    .compactMap { Int($0) }
                    .reduce(0, +)
            }
        
        let maxCalories = calorieCounts.max()!
        print("maxCalories: \(maxCalories)")

        let top3 = calorieCounts.max(count: 3).reduce(0, +)
        print("top3: \(top3)")
    }
}
