import Algorithms
import Foundation
import Utils

@main
struct Day11: Exercise {
    let monkeys: [Monkey]
    
    init(input: Input) {
        self.monkeys = input.rawValue
            .components(separatedBy: "\n\n")
            .map(Monkey.parse)
    }
    
    var partOne: String {
        Simulation(monkeys: monkeys, worryReductionStrategy: .divideByThree)
            .tick(times: 20)
            .monkeys
            .sorted(by: >)
            .prefix(2)
            .map(\.inspectionCount)
            .product
            .description
    }
    
    var partTwo: String {
        Simulation(monkeys: monkeys, worryReductionStrategy: .modByDivisor)
            .tick(times: 10_000)
            .monkeys
            .sorted(by: >)
            .prefix(2)
            .map(\.inspectionCount)
            .product
            .description
    }
}
