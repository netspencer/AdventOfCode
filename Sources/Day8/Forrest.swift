import Foundation

/// Forrest is a grid of tree heights
struct Forrest {
    typealias Height = Int
    typealias Coordinate = (row: Int, column: Int)

    enum Direction: CaseIterable {
        case up, down, left, right
    }
    
    let rows: Int
    let columns: Int
    
    let heights: [[Height]]
    
    init(rows: Int, columns: Int, heights: [[Height]]) {
        self.rows = rows
        self.columns = columns
        self.heights = heights
    }
    
    var coordinates: [Coordinate] {
        (0..<rows).flatMap { row in
            (0..<columns).map { column in
                return (row: row, column: column)
            }
        }
    }
    
    subscript(_ coordinate: Coordinate) -> Height {
        heights[coordinate.row][coordinate.column]
    }
    
    func adjacentCoordinates(_ coordinate: Coordinate, direction: Direction) -> [Coordinate] {
        switch direction {
        case .left:
            return (0..<coordinate.column)
                .map { (row: coordinate.row, column: $0) }
                .reversed()
        case .right:
            return (coordinate.column+1..<columns)
                .map { (row: coordinate.row, column: $0) }
        case .up:
            return (0..<coordinate.row)
                .map { (row: $0, column: coordinate.column) }
                .reversed()
        case .down:
            return (coordinate.row+1..<rows)
                .map { (row: $0, column: coordinate.column) }
        }
    }
    
    func adjacentValues(_ coordinate: Coordinate, direction: Direction) -> [Height] {
        adjacentCoordinates(coordinate, direction: direction).map { self[$0] }
    }
}

extension Forrest {
    func isVisible(at coordinate: Coordinate) -> Bool {
        Direction.allCases.contains { direction in
            guard let minAdjacentValue = adjacentValues(coordinate, direction: direction).max() else {
                return true
            }
            return self[coordinate] > minAdjacentValue
        }
    }
    
    func scenicScore(for coordinate: Coordinate) -> Int {
        func viewingDistance(direction: Direction) -> Int {
            let adj = adjacentValues(coordinate, direction: direction)
            let ret = adj.enumerated()
                .first {
                    $0.element >= self[coordinate]
                }?.offset
            return ret.map { $0 + 1 } ?? adj.count
        }
        
        return Direction.allCases
            .map(viewingDistance(direction:))
            .reduce(1, *)
    }
}
