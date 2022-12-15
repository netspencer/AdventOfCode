import Algorithms
import Foundation
import Utils

struct Cave {
    let rocks: Set<Point>
    var items: Set<Point>
    var width: ClosedRange<Point.X>
    var depth: ClosedRange<Point.Y>
    
    init(rocks: Set<Point>) {
        self.rocks = rocks
        self.items = rocks
        self.width = items.widthRange
        self.depth = (0...items.floor)
    }
    
    var sandCount: Int {
        items.count - rocks.count
    }
    
    mutating func dropSand(
        from origin: Point = Point(x: 500, y: 0),
        isEndlessVoid: Bool
    ) -> Point? {
        func nextMove(for point: Point) -> Point? {
            [point.down, point.downLeft, point.downRight].first {
                !items.contains($0) && depth.contains($0.y)
            }
        }

        var point = origin
        while let nextMove = nextMove(for: point) {
            point = nextMove
        }
        if point == origin {
            items.insert(point)
            return nil
        }
        if point.y == depth.upperBound && isEndlessVoid {
            return nil
        }
        if point.y == depth.upperBound {
            point = Point(x: point.x, y: point.y - 1)
        }
        items.insert(point)
        return point
    }

    mutating func extendFloor(by y: Int) {
        depth = depth.lowerBound...(depth.upperBound + 2)
    }
    
    func filledWithSand(isEndlessVoid: Bool = true) -> Cave {
        var new = self
        if !isEndlessVoid {
            new.extendFloor(by: 2)
        }
        while new.dropSand(isEndlessVoid: isEndlessVoid) != nil {}
        return new
    }
}

extension Cave: CustomStringConvertible {
    var description: String {
        depth.map { y in
            width.map { x in
                rocks.contains(Point(x: x, y: y))
                    ? "#"
                    : items.contains(Point(x: x, y: y))
                        ? "o" : "."
            }
            .joined()
        }
        .joined(separator: "\n")
    }
}

extension Set where Element == Point {
    var widthRange: ClosedRange<Point.X> {
        let xs = map(\.x)
        let min = xs.min() ?? 0
        let max = xs.max() ?? 0
        return (min...max)
    }
    
    var floor: Point.Y {
        map(\.y).max() ?? 0
    }
}
