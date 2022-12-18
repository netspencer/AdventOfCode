import Foundation

extension Direction {
    static func parse(_ input: Character) -> Direction? {
        switch input {
        case ">": return .right
        case "<": return .left
        default: return nil
        }
    }
}

extension Rock {
    static func parse(_ input: some StringProtocol) -> Rock {
        var points: Set<Point> = []
        for (y, line) in input.split(separator: "\n").reversed().enumerated() {
            for (x, c) in line.enumerated() {
                if c == "#" {
                    points.insert(Point(x: x, y: y))
                }
            }
        }
        return Rock(points: points)
    }
}
