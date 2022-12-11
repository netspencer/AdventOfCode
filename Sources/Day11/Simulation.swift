import Algorithms
import Foundation
import Utils

enum WorryReducationStrategy {
    case divideByThree
    case modByDivisor
}

struct Simulation {
    var monkeys: [Monkey]
    let reduceWorry: (Int) -> Int
    
    init(monkeys: [Monkey], worryReductionStrategy: WorryReducationStrategy) {
        self.monkeys = monkeys
        switch worryReductionStrategy {
        case .divideByThree:
            self.reduceWorry = { val in val / 3 }
        case .modByDivisor:
            self.reduceWorry = { val in val % monkeys.map(\.test).product }
        }
    }
    
    init(monkeys: [Monkey], reduceWorry: @escaping (Int) -> Int) {
        self.monkeys = monkeys
        self.reduceWorry = reduceWorry
    }
    
    func tick() -> Simulation {
        var newMonkeys = monkeys
        for monkeyNumber in newMonkeys.indices {
            for _ in newMonkeys[monkeyNumber].items.indices {
                if let inspected = newMonkeys[monkeyNumber].inspectItem(reduceWorry: reduceWorry) {
                    newMonkeys[inspected.1].catchItem(inspected.0)
                }
            }
        }
        return Simulation(monkeys: newMonkeys, reduceWorry: reduceWorry)
    }
    
    func tick(times: Int) -> Simulation {
        (0..<times).reduce(self, { sim, _ in sim.tick() })
    }
}
