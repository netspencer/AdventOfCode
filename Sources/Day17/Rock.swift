import Foundation

struct Rock {
    let points: Set<Point>
    
    init(points: Set<Point>) {
        self.points = points
    }
    
    func moving(_ direction: Direction, count: Int = 1) -> Rock {
        Rock(
            points: Set(points.map {
                $0.moving(direction, count: count)
            })
        )
    }
    
    func isValid(in grid: [Set<Int>]) -> Bool {
        points.allSatisfy { point in
            guard (0...6).contains(point.x) else { return false }
            guard point.y >= 0 else { return false }
            guard grid.indices.contains(point.y) else { return true }
            return !grid[point.y].contains(point.x)
        }
    }
    
    func moving(_ direction: Direction, count: Int = 1, in grid: [Set<Int>]) -> Rock {
        let movedRock = moving(direction, count: count)
        guard movedRock.isValid(in: grid) else { return self }
        return movedRock
    }
    
    func isDoneFalling(in grid: [Set<Int>]) -> Bool {
        !moving(.down).isValid(in: grid)
    }
}
