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
    
    func moving(_ direction: Direction, count: Int = 1) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y - count)
        case .down: return Point(x: x, y: y + count)
        case .left: return Point(x: x - count, y: y)
        case .right: return Point(x: x + count, y: y)
        }
    }
    
    func wrapping(in grid: [Point: Tile], moving direction: Direction) -> Point {
        var newPoint = self
        switch direction {
        case .up:
            newPoint.y = grid.yRange(forX: x).upperBound
        case .down:
            newPoint.y = grid.yRange(forX: x).lowerBound
        case .left:
            newPoint.x = grid.xRange(forY: y).upperBound
        case .right:
            newPoint.x = grid.xRange(forY: y).lowerBound
        }
        return newPoint
    }
    
    var description: String {
        "(x: \(x), y: \(y))"
    }
}

extension Dictionary<Point, Tile> {
    func xRange(forY y: Point.Y) -> ClosedRange<Point.X> {
        let xs = keys.filter { $0.y == y }.map(\.x)
        return xs.min()! ... xs.max()!
    }
    
    func yRange(forX x: Point.X) -> ClosedRange<Point.Y> {
        let ys = keys.filter { $0.x == x }.map(\.y)
        return ys.min()! ... ys.max()!
    }
}
