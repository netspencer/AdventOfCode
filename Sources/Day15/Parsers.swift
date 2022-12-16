import Algorithms
import Foundation
import Utils

enum TwoPoints {
    static func parse(_ input: String) -> (Point, Point) {
        let ints = input.integers
        return (
            Point(x: ints[0], y: ints[1]), 
            Point(x: ints[2], y: ints[3])
        )
    }
}

extension BeaconMap {
    static func parse(_ input: Input) -> BeaconMap {
        self.init(
            pointPairs: input.lines
                .lazy
                .map(TwoPoints.parse)
                .map { sensor, beacon in
                    return (sensor, beacon, sensor.manhattanDistance(to: beacon))
                }
        )
    }
}
