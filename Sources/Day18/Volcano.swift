import Foundation
import Collections

struct Volcano {
    struct Bounds {
        let x: ClosedRange<Int>
        let y: ClosedRange<Int>
        let z: ClosedRange<Int>

        init(lava: [Point]) {
            let xs = lava.map(\.x)
            let ys = lava.map(\.y)
            let zs = lava.map(\.z)
            
            self.x = (xs.min()! - 1)...(xs.max()! + 1)
            self.y = (ys.min()! - 1)...(ys.max()! + 1)
            self.z = (zs.min()! - 1)...(zs.max()! + 1)
        }
        
        func contains(_ point: Point) -> Bool {
            x.contains(point.x) && y.contains(point.y) && z.contains(point.z)
        }
    }
    
    let lava: Set<Point>
    let bounds: Bounds
    
    init(lava: [Point]) {
        self.lava = Set(lava)
        self.bounds = Bounds(lava: lava)
    }
    
    var externalSpace: Set<Point> {
        var space = Set<Point>()
        var queue = Deque([Point.zero])
        
        while let point = queue.popFirst() {
            guard bounds.contains(point) else { continue }
            
            for adjacentPoint in point.adjacentPoints {
                guard !lava.contains(adjacentPoint), !space.contains(adjacentPoint) else { continue }
                queue.append(adjacentPoint)
                space.insert(adjacentPoint)
            }
        }
        
        return space
    }
        
    var surfaceArea: Int {
        lava.lazy
            .flatMap(\.adjacentPoints)
            .filter { !lava.contains($0) }
            .count
    }
    
    var externalSurfaceArea: Int {
        lava.lazy
            .flatMap(\.adjacentPoints)
            .filter(externalSpace.contains)
            .count
    }
}
