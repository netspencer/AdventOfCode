import Foundation

struct Point: Hashable {
    typealias X = Int
    typealias Y = Int
    
    let x: X
    let y: Y
    
    init(x: X, y: Y) {
        self.x = x
        self.y = y
    }
    
    var down: Point {
        Point(x: x, y: y + 1)
    }
    
    var downLeft: Point {
        Point(x: x - 1, y: y + 1)
    }
    
    var downRight: Point {
        Point(x: x + 1, y: y + 1)
    }
}
