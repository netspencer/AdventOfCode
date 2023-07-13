import Foundation

struct Point: Hashable, CustomStringConvertible {
    typealias X = Int
    typealias Y = Int
    
    var x: X
    var y: Y
    
    init(x: X, y: Y) {
        self.x = x
        self.y = y
    }
    
    static let zero = Point(x: 0, y: 0)
    
    var description: String {
        "(x: \(x), y: \(y))"
    }
}
