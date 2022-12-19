import Foundation
import Utils

extension Point {
    static func parse(_ input: some StringProtocol) -> Point {
        let (x, y, z) = input.split(separator: ",").map { Int($0)! }.splat()
        return self.init(x: x, y: y, z: z)
    }
}

extension Volcano {
    static func parse(_ input: Input) -> Volcano {
        return self.init(lava: input.lines.map(Point.parse))
    }
}
