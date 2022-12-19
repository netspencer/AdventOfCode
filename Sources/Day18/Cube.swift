import Foundation

struct Cube: Hashable {
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
    
    func moving(along axis: Axis, distance: Int) -> Cube {
        Cube(
            x: x + (axis == .x ? distance : 0),
            y: y + (axis == .y ? distance : 0),
            z: z + (axis == .z ? distance : 0)
        )
    }
    
    var adjacentCubes: [Cube] {
        Axis.allCases.flatMap { axis in
            [-1, 1].map { distance in
                moving(along: axis, distance: distance)
            }
        }
    }
}
