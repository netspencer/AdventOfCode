import Foundation
import Utils

extension Grove {
    static func parse(_ input: Input) -> Grove {
        Grove(elves: Set(input.lines.enumerated().flatMap { y, line in
            line.enumerated().compactMap { x, char in
                guard char == "#" else { return nil }
                return Point(x: x, y: y)
            }
        }))
    }
}
