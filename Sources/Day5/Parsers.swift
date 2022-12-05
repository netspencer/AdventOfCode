import Algorithms
import Foundation
import Utils

extension CargoShip {
    static func parse(_ input: String) -> Self {
        self.init(
            cargo: input.components(separatedBy: .newlines).dropLast()
                .map {
                    $0.chunks(ofCount: 4)
                        .compactMap {
                            $0.filter { $0.isLetter || $0.isWhitespace }.first
                        }
                }
                .reversed()
                .enumerated()
                .reduce(into: [[]]) { partialResult, next in
                    if next.offset == 0 {
                        partialResult = next.element.map { char in
                            [char]
                        }
                    } else {
                        next.element.enumerated().forEach { item in
                            if item.element.isLetter {
                                partialResult[item.offset].append(item.element)
                            }
                        }
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
