import Foundation
import Utils

@main
struct Day19: Exercise {
    let blueprints: [Blueprint]
    
    init(input: Input) {
        self.blueprints = Blueprints.parse(input)
    }
    
    var partOne: String {
        blueprints
            .map { $0.index * $0.maxGeodes(in: 24) }
            .sum
            .description
    }
    
    var partTwo: String {
        blueprints
            .prefix(3)
            .map { $0.maxGeodes(in: 32) }
            .product
            .description
    }
}
