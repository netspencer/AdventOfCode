import Algorithms
import Foundation
import Utils

extension Cave {
    static func parse(_ input: Input) -> Cave {
        Cave(
            rocks: Set(input.lines
                .flatMap {
                    $0.components(separatedBy: " -> ")
                        .map { coordinates -> Point in
                            let (x, y) = coordinates.split(separator: ",").splat()
                            return Point(x: Int(x)!, y: Int(y)!)
                        }
                        .adjacentPairs()
                        .flatMap { line in
                            pointsAlongLine(line)
                        }
                })
        )
    }
}

func pointsAlongLine(_ line: (Point, Point)) -> [Point] {
    if line.0.x == line.1.x {
        return (line.0.y < line.1.y ? (line.0.y...line.1.y) : (line.1.y...line.0.y))
            .map { Point(x: line.0.x, y: $0) }
    } else {
        assert(line.0.y == line.1.y)
        return (line.0.x < line.1.x ? (line.0.x...line.1.x) : (line.1.x...line.0.x))
            .map { Point(x: $0, y: line.0.y) }
    }
}
