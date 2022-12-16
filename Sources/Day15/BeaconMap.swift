import Algorithms
import Foundation
import Utils

struct BeaconMap {
    typealias PointPair = (Point, Point, ManhattanDistance)
    typealias ManhattanDistance = Int

    // distances from each sensor to nearest beacon
    let pointPairs: [PointPair]

    init(pointPairs: [PointPair]) {
        self.pointPairs = pointPairs
    }
    
    func locationsWithoutBeacons(
        forY y: Point.Y,
        clamed range: ClosedRange<Point.X>? = nil
    ) -> Set<ClosedRange<Point.X>> {
        var locations = Set<ClosedRange<Point.X>>()
        
        for (sensor, _, distanceToNearestBeacon) in pointPairs {
            let nearestPointInRow = Point(x: sensor.x, y: y) // a straight line is always the shortest
            let distanceToNearestPointOnLine = sensor.manhattanDistance(to: nearestPointInRow)
            
            guard distanceToNearestPointOnLine < distanceToNearestBeacon else { continue }
            
            let gap = distanceToNearestBeacon - distanceToNearestPointOnLine
            
            var left = sensor.x - gap
            var right = sensor.x + gap
            
            if let range {
                left = max(range.lowerBound, sensor.x - gap)
                right = min(range.upperBound, sensor.x + gap)
            }
            
            // all the points on the line that are closer to the sensor must not contain a beacon
            locations.insert(left ... right)
        }
        
        return locations
    }
    
    func countLocationsWhereNoBeaconPossible(forY y: Point.Y) -> Int {
        var locations = Set<Point.X>()
        
        for range in locationsWithoutBeacons(forY: y) {
            locations.formUnion(range)
        }
        
        // remove all the points that actually do have a sensor or beacon
        for (sensor, beacon, _) in pointPairs {
            if sensor.y == y { locations.remove(sensor.x) }
            if beacon.y == y { locations.remove(beacon.x) }
        }
        
        return locations.count
    }
    
    func findUndetectedBeacon(in searchSpace: ClosedRange<Point.Y>) -> Point {
        for y in searchSpace {
            var beacons = IndexSet(integersIn: searchSpace)
            
            for range in locationsWithoutBeacons(forY: y, clamed: searchSpace) {
                beacons.remove(integersIn: range)
            }
            
            if beacons.count > 0 {
                let x = beacons.first!
                return Point(x: x, y: y)
            }
        }
        
        fatalError()
    }
}

