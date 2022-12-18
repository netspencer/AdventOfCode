import Foundation

struct Point: Hashable, CustomStringConvertible {
    typealias X = Int
    typealias Y = Int
    
    let x: X
    let y: Y
    
    init(x: X, y: Y) {
        self.x = x
        self.y = y
    }

    func manhattanDistance(to other: Point) -> Int {
		abs(x - other.x) + abs(y - other.y)
	}

    var tuningFrequency: Int {
        x * 4_000_000 + y
    }

    var description: String {
        "(x: \(x), y: \(y))"
    }
}
