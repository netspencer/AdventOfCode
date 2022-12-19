import Foundation

struct Point: Hashable {
    enum Axis: CaseIterable {
        case x, y, z
    }
    
    let x: Int
    let y: Int
    let z: Int
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    static let zero = Point(x: 0, y: 0, z: 0)
    
    func moving(along axis: Axis, distance: Int) -> Point {
        Point(
            x: x + (axis == .x ? distance : 0),
            y: y + (axis == .y ? distance : 0),
            z: z + (axis == .z ? distance : 0)
        )
    }
    
    var adjacentPoints: [Point] {
        Axis.allCases.flatMap { axis in
            [-1, 1].map { distance in
                moving(along: axis, distance: distance)
            }
        }
    }
}
