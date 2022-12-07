import Algorithms
import Foundation
import Utils

@main
struct Day7: Exercise {
    let fileSystem: FileSystem
    
    init(input: Input) {
        self.fileSystem = .parse(input)
    }
    
    var partOne: String {
        fileSystem
            .directorySizes
            .filter { $0 <= 100_000 }
            .sum
            .description
    }
    
    var partTwo: String {
        fileSystem
            .directorySizes
            .filter { $0 >= fileSystem.overflowSize }
            .min()!
            .description
    }
}
