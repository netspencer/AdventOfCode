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
    
    func locationsWithoutBeacons(forY y: Point.Y) -> Set<Point.X> {
        var locations = Set<Point.X>()
        
        for (sensor, _, distanceToNearestBeacon) in pointPairs {
            let nearestPointInRow = Point(x: sensor.x, y: y) // a straight line is always the shortest
            let distanceToNearestPointOnLine = sensor.manhattanDistance(to: nearestPointInRow)
            
            guard distanceToNearestPointOnLine < distanceToNearestBeacon else { continue }
            
            let gap = distanceToNearestBeacon - distanceToNearestPointOnLine
            
            // all the points on the line that are closer to the sensor must not contain a beacon
            locations.formUnion((sensor.x - gap) ... (sensor.x + gap))
        }
        
        return locations
    }
    
    func countLocationsWhereNoBeaconPossible(forY y: Point.Y) -> Int {
        var locations = locationsWithoutBeacons(forY: y)
        
        // remove all the points that actually do have a sensor or beacon
        for (sensor, beacon, _) in pointPairs {
            if sensor.y == y { locations.remove(sensor.x) }
            if beacon.y == y { locations.remove(beacon.x) }
        }
        
        return locations.count
    }
    
    func findUndetectedBeacon(in searchSpace: ClosedRange<Point.Y>) -> Point {
        for y in searchSpace {
            var unseen = IndexSet(integersIn: searchSpace)
            
            for (sensor, _, distanceToNearestBeacon) in pointPairs {
                let nearestPointInRow = Point(x: sensor.x, y: y) // a straight line is always the shortest
                let distanceToNearestPointOnLine = sensor.manhattanDistance(to: nearestPointInRow)
                
                guard distanceToNearestPointOnLine < distanceToNearestBeacon else { continue }
                
                let gap = distanceToNearestBeacon - distanceToNearestPointOnLine
                
                let left = max(0, sensor.x - gap)
                let right = min(searchSpace.upperBound, sensor.x + gap)
                
                unseen.remove(integersIn: left ... right)
            }
            
            if unseen.count > 0 {
                let x = unseen.first!
                return Point(x: x, y: y)
            }
        }
        
        fatalError()
    }
}

