import Algorithms
import Foundation
import Utils

extension String {
    func firstUniqueSubsequence(length: Int) -> Int? {
        windows(ofCount: length).enumerated()
            .first { $0.element.isUnique }?
            .offset.advanced(by: length)
    }
}

extension Substring {
    var isUnique: Bool {
        Set(self).count == self.count
    }
}
