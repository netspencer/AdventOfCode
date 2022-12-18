import Foundation

struct Point: Hashable, CustomStringConvertible {
    typealias X = Int
    typealias Y = Int
    
    let x: X
    let y: Y
    
    init(x: X, y: Y) {
        self.x = x
        self.y = y
    }

    static let zero = Point(x: 0, y: 0)
    
    func moving(_ direction: Direction, count: Int) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y + count)
        case .down: return Point(x: x, y: y - count)
        case .left: return Point(x: x - count, y: y)
        case .right: return Point(x: x + count, y: y)
        }
    }
    
    var description: String {
        "(x: \(x), y: \(y))"
    }
}
