import Foundation

struct Volcano {
    let lava: Set<Cube>
    
    init(lava: [Cube]) {
        self.lava = Set(lava)
    }
    
    var surfaceArea: Int {
        lava.lazy
            .flatMap(\.adjacentCubes)
            .filter { !lava.contains($0) }
            .count
    }
}
