import Algorithms
import Foundation
import Utils

struct Cave {
    var items: Set<Point>
    let widthRange: ClosedRange<Point.X>
    let floorDepth: Point.Y
    
    init(items: Set<Point>) {
        self.items = items
        self.widthRange = items.widthRange
        dump(widthRange)
        self.floorDepth = items.floorDepth
    }
    
    func dropSand(from origin: Point = Point(x: 500, y: 0)) -> Point? {
        var point = origin
        while let nextMove = nextMove(for: point) {
            point = nextMove
        }
        guard !items.contains(point) && point != origin else { return nil }
        return point
    }
    
    func nextMove(for point: Point) -> Point? {
        [point.down, point.downLeft, point.downRight].first {
            !items.contains($0)
                && widthRange.contains($0.x)
                && $0.y <= floorDepth
        }
    }
}

extension Set where Element == Point {
    var widthRange: ClosedRange<Point.X> {
        let xs = self.map(\.x)
        let min = xs.min() ?? 0
        let max = xs.max() ?? 0
        return (min...max)
    }
    
    var floorDepth: Point.Y {
        self.map(\.y).max() ?? 0
    }
}
