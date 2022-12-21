import Foundation
import Utils

@main
struct Day21: Exercise {
    let monkeys: [Monkey]
    
    init(input: Input) {
        self.monkeys = input.lines.map(Monkey.parse)
    }
    
    var partOne: String {
        monkeys.solved()["root"]?.description ?? ""
    }
}
