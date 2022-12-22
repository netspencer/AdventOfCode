import Foundation

struct Jungle {
    let instructions: [Instruction]
    let grid: [Point: Tile]
    
    init(instructions: [Instruction], grid: [Point: Tile]) {
        self.instructions = instructions
        self.grid = grid
    }
    
    var finalPosition: (Point, Direction) {
        var position = grid.startingPosition
        var direction = Direction.right
        
        for instruction in instructions {
            switch instruction {
            case let .move(moves):
                for _ in 1 ... moves {
                    var newPosition = position.moving(direction)
                    
                    switch grid[newPosition] {
                    case .open:
                        position = newPosition
                        
                    case .wall:
                        continue
                        
                    case .none:
                        newPosition = newPosition.wrapping(in: grid, moving: direction)
                        guard grid[newPosition] == .open else { continue }
                        position = newPosition
                    }
                }
                
            case let .turn(turnDirection):
                direction.rotate(towards: turnDirection)
            }
        }
        
        return (position, direction)
    }
    
    var finalPassword: Int {
        let (point, direction) = finalPosition
        return (point.y + 1) * 1000 + (point.x + 1) * 4 + direction.score
    }
}

extension Dictionary<Point, Tile> {
    var startingPosition: Point {
        let minY = keys.min(by: { $0.y < $1.y })!.y
        let minX = keys.filter({ $0.y == minY }).min(by: { $0.x < $1.x })!.x
        return Point(x: minX, y: minY)
    }
}
