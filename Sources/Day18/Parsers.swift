import Foundation
import Utils

extension Cube {
    static func parse(_ input: some StringProtocol) -> Cube {
        let (x, y, z) = input.split(separator: ",").map { Int($0)! }.splat()
        return self.init(x: x, y: y, z: z)
    }
}

extension Volcano {
    static func parse(_ input: Input) -> Volcano {
        return self.init(lava: input.lines.map(Cube.parse))
    }
}
