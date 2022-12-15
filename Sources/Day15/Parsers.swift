import Algorithms
import Foundation
import Utils

enum PointPair {
    static func parse(_ input: String) -> (Point, Point) {
        let ints = input.integers
        return (
            Point(x: ints[0], y: ints[1]), 
            Point(x: ints[2], y: ints[3])
        )
    }
}

enum ManhattanDistanceMap {
    static func parse(_ input: Input) -> [Point: Int] {
        parse(input.lines.map(PointPair.parse))
    }

    static func parse(_ input: [(Point, Point)]) -> [Point: Int] {
        input
			.reduce(into: [Point: Int]()) { dict, tuple in
				let (sensor, beacon) = tuple
				dict[sensor] = sensor.manhattanDistance(to: beacon)
			}
    }
}

extension BeaconMap {
    static func parse(_ input: Input) -> BeaconMap {
        self.init(distances: ManhattanDistanceMap.parse(input))
    }
}