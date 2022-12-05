import Algorithms
import Foundation
import Utils

extension CargoShip {
    static func parse(_ input: String) -> Self {
        self.init(
            cargo: input.components(separatedBy: .newlines).dropLast()
                .reversed()
                .reduce(into: [[Character]]()) { stacks, line in
                    for (i, c) in line.enumerated() {
                        guard c.isLetter else { continue }
                        let stackNumber = i / 4
                        if !stacks.indices.contains(stackNumber) {
                            stacks.insert([], at: stackNumber)
                        }
                        stacks[stackNumber].append(c)
                    }
                }
        )
    }
}

extension Instruction {
    static func parse(_ input: Substring) -> Self {
        let (quantity, sourceStack, destinationStack) = input.split(separator: " ")
            .filter { $0.allSatisfy(\.isNumber) }
            .compactMap { Int($0) }
            .splat()
        return self.init(
            quantity: quantity,
            sourceStack: sourceStack,
            destinationStack: destinationStack
        )
    }
}
