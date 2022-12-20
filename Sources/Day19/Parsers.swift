import Algorithms
import Foundation
import Utils

enum Blueprints {
    static func parse(_ input: Input) -> [Blueprint] {
        input.rawValue.integers
            .chunks(ofCount: 7)
            .compactMap(Blueprint.parse)
    }
}

extension Blueprint {
    static func parse(_ input: ArraySlice<Int>) -> Blueprint? {
        guard input.count == 7 else { return nil }
        return Blueprint(
            index: input[input.startIndex + 0],
            robotCosts: [
                .ore: [
                    Cost(rock: .ore, quantity: input[input.startIndex + 1]),
                ],
                .clay: [
                    Cost(rock: .ore, quantity: input[input.startIndex + 2]),
                ],
                .obsidian: [
                    Cost(rock: .ore, quantity: input[input.startIndex + 3]),
                    Cost(rock: .clay, quantity: input[input.startIndex + 4]),
                ],
                .geode: [
                    Cost(rock: .ore, quantity: input[input.startIndex + 5]),
                    Cost(rock: .obsidian, quantity: input[input.startIndex + 6]),
                ],
            ]
        )
    }
}
