import Algorithms
import Foundation
import Utils

struct BeaconMap {
    typealias ManhattanDistance = Int

    // distances from each sensor to nearest beacon
    let distances: [Point: ManhattanDistance]

    init(distances: [Point: ManhattanDistance]) {
        self.distances = distances
    }

    func fusedXRanges(forY y: Point.Y, clamped limit: ClosedRange<Point.Y>? = nil) -> Set<ClosedRange<Point.X>> {
        var ranges = distances
            .compactMap { sensor, max -> ClosedRange<Int>? in
                let xRange = max - abs(sensor.y - y)
                guard xRange > 0 else { return nil }
                return sensor.x - xRange ... sensor.x + xRange
            }
        if let limit {
            ranges = ranges.compactMap { $0.clamped(to: limit) }
        }
        return Set(ranges).fused()
    }

    func numLocationsWhereNoBeaconPossible(forY y: Point.Y) -> Int {
        fusedXRanges(forY: y)
            .map(\.count)
            .sum - 1
    }

    func findUndetectedBeacon(searchSpace: ClosedRange<Point.Y>) -> Point? {
        for y in searchSpace {
            let fusedRanges = fusedXRanges(forY: y, clamped: searchSpace)
            guard fusedRanges != [searchSpace] else { continue }
            let x = fusedRanges.map(\.upperBound).min()! + 1
            return Point(x: x, y: y)
        }
        return nil
    }
}

extension Point {
    var tuningFrequency: Int {
        x * 4_000_000 + y
    }
}