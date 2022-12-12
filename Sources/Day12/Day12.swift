import Algorithms
import Foundation
import Utils

@main
struct Day12: Exercise {
    let input: String
    let heightMap: HeightMap
    
    init(input: Input) {
        self.input = input.rawValue
        self.heightMap = .parse(input)
    }
    
    var partOne: String {
        heightMap
            .shortestPathDistance(
                from: heightMap.start,
                to: { $0 == heightMap.end },
                shouldMoveUphill: true
            )
            .description
    }
    
    var partTwo: String {
        heightMap
            .shortestPathDistance(
                from: heightMap.end,
                to: { heightMap[$0] == "a" },
                shouldMoveUphill: false
            )
            .description
    }
}
