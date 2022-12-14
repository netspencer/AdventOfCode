import Algorithms
import Foundation
import Utils

@main
struct Day13: Exercise {
    init(input: Input) {
        var cave = Cave.parse(input)
        dump(cave)

        var sandCount = 0
        while let sand = cave.dropSand() {
            cave.items.insert(sand)
            sandCount += 1
            print("sand \(sandCount)", sand)
        }

        print("sandCount", sandCount)
    }
}
