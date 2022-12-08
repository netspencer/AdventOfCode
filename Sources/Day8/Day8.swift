import Algorithms
import Foundation
import Utils

@main
struct Day7: Exercise {
    let grid: Grid<Int>
    
    init(input: Input) {
        self.grid = .parse(input)
    }
    
    var partOne: String {
        grid
            .coordinates
            .filter { grid.isGreaterThanAdjacentValues($0) }
            .count
            .description
    }
    
    var partTwo: String {
        grid
            .coordinates
            .map { grid.smallerAdjacentValuesProduct($0) }
            .max()!
            .description
    }
}
