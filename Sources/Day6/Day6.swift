import Algorithms
import Foundation
import Utils

@main
struct Day6: Exercise {
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var partOne: String {
        input.rawValue
            .firstUniqueSubsequence(length: 4)?
            .description ?? ""
    }
    
    var partTwo: String {
        input.rawValue
            .firstUniqueSubsequence(length: 14)?
            .description ?? ""
    }
}

extension String {
    func firstUniqueSubsequence(length: Int) -> Int? {
        (length...count).first { position in
            self.subsequence(position: position, length: length).isUnique
        }
    }
    
    func subsequence(position: Int, length: Int) -> Substring {
        let end = index(startIndex, offsetBy: position)
        let start = index(end, offsetBy: -length)
        return self[start..<end]
    }
}

extension Substring {
    var isUnique: Bool {
        Set(self).count == self.count
    }
}
