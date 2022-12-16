import Algorithms
import Foundation
import Utils

struct BeaconMap {
    typealias ManhattanDistance = Int

    // distances from each sensor to nearest beacon
    let points: [(Point, Point, ManhattanDistance)]

    init(points: [(Point, Point, ManhattanDistance)]) {
        self.points = points
    }
    
    func numPointsWhereNoBeaconPossible(forY y: Point.Y) -> Int {
        var seen = Set<Int>()
        
        for (s, _, d) in points {
            let distanceToY = abs(y - s.y)
            guard distanceToY < d else { continue }
            
            let wiggle = d - distanceToY
            let l = s.x - wiggle
            let r = s.x + wiggle
            seen.formUnion(l ... r)
        }
        
        for (s, b, _) in points {
            if s.y == y { seen.remove(s.x) }
            if b.y == y { seen.remove(b.x) }
        }
        
        return seen.count
    }
    
    func findUndetectedBeacon(in searchSpace: ClosedRange<Point.Y>) -> Point {
        for y in searchSpace {
            var unseen = IndexSet(integersIn: searchSpace)
            for (s, _, d) in points {
                let distanceToY = abs(y - s.y)
                guard distanceToY < d else { continue }
                
                let wiggle = d - distanceToY
                let l = (s.x - wiggle < 0) ? 0 : s.x - wiggle
                let r = (s.x + wiggle > searchSpace.upperBound) ? searchSpace.upperBound : s.x + wiggle
                unseen.remove(integersIn: l ... r)
            }
            
            if unseen.count > 0 {
                let x = unseen.first!
                return Point(x: x, y: y)
            }
        }
        
        fatalError()
    }
}

