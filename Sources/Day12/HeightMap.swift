import Algorithms
import Collections
import Foundation
import Utils

struct HeightMap {
    let grid: [[Character]]
    let start: Coordinate
    let end: Coordinate
    
    init(grid: [[Character]], start: Coordinate, end: Coordinate) {
        self.grid = grid
        self.start = start
        self.end = end
    }
    
    subscript(_ coordinate: Coordinate) -> Character? {
        guard grid.indices.contains(coordinate.row) else {
            return nil
        }
        guard grid[coordinate.row].indices.contains(coordinate.column) else {
            return nil
        }
        return grid[coordinate.row][coordinate.column]
    }
    
    /// the graph neighbors
    func potentialMoves(
        from coordinate: Coordinate,
        shouldMoveUphill: Bool
    ) -> [Coordinate] {
        guard let from = self[coordinate] else { return [] }
        var moves = [Coordinate]()
        
        func isValid(_ character: Character) -> Bool {
            let difference = from.difference(character)
            if shouldMoveUphill {
                return !(difference > 1)
            } else {
                return !(difference < -1)
            }
        }
        
        if let up = self[coordinate.up], isValid(up) {
            moves.append(coordinate.up)
        }
        
        if let down = self[coordinate.down], isValid(down) {
            moves.append(coordinate.down)
        }

        if let left = self[coordinate.left], isValid(left) {
            moves.append(coordinate.left)
        }

        if let right = self[coordinate.right], isValid(right) {
            moves.append(coordinate.right)
        }
        
        return moves
    }
    
    func shortestPathDistance(
        from startCoordinate: Coordinate,
        to stopCondition: (Coordinate) -> Bool,
        shouldMoveUphill: Bool
    ) -> Int {
        var distances = [Coordinate: Int]()
        distances[startCoordinate] = 0
        
        var queue = Deque<Coordinate>([startCoordinate])
        
        while let coordinate = queue.popFirst() {
            let distance = distances[coordinate, default: .max]
            guard !stopCondition(coordinate) else {
                return distances[coordinate, default: -1]
            }
            for move in potentialMoves(from: coordinate, shouldMoveUphill: shouldMoveUphill) {
                let nextDistance = distance + 1
                if nextDistance < distances[move, default: .max] {
                    distances[move] = nextDistance
                    queue.append(move)
                }
            }
        }
        
        return -1
    }
}
