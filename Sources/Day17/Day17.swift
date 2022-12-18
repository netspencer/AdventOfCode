import Algorithms
import Foundation
import Collections
import Utils

@main
struct Day17: Exercise {
    let rocks: [Rock]
    let gas: [Direction]
    
    init(input: Input) {
        self.rocks = InputData.rocks
            .components(separatedBy: "\n\n")
            .map(Rock.parse)
        
        dump(rocks)
        
        self.gas = input.rawValue.compactMap(Direction.parse)
    }
    
    var partOne: String {
        var cave = Cave(rocks: rocks, gas: gas)
        cave.dropRocks(count: 2022)
        return cave.height.description
    }
}

enum InputData {
    static let rocks = """
    ####
    
    .#.
    ###
    .#.
    
    ..#
    ..#
    ###
    
    #
    #
    #
    #
    
    ##
    ##
    """
}
