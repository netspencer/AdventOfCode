import Algorithms
import Foundation
import SwiftGraph
import Utils

@main
struct Day16: Exercise {
    let pipeNetwork: PipeNetwork
    
    init(input: Input) {
        self.pipeNetwork = .parse(input)
    }
    
    var partOne: String {
        pipeNetwork
            .maximumPressure
            .description
    }
}

