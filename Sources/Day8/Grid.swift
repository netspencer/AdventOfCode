import Foundation

struct Grid<Value> {
    typealias Coordinate = (row: Int, column: Int)
    
    enum Direction: CaseIterable {
        case up, down, left, right
    }
    
    let rows: Int
    let columns: Int
    
    let values: [[Value]]
    
    init(rows: Int, columns: Int, values: [[Value]]) {
        self.rows = rows
        self.columns = columns
        self.values = values
    }
    
    var coordinates: [Coordinate] {
        (0..<rows).flatMap { row in
            (0..<columns).map { column in
                return (row: row, column: column)
            }
        }
    }
    
    subscript(_ coordinate: Coordinate) -> Value {
        values[coordinate.row][coordinate.column]
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
    
    func adjacentValues(_ coordinate: Coordinate, direction: Direction) -> [Value] {
        adjacentCoordinates(coordinate, direction: direction).map { self[$0] }
    }
}

extension Grid where Value == Int {
    func isGreaterThanAdjacentValues(_ coordinate: Coordinate, direction: Direction) -> Bool {
        guard let minAdjacentValue = adjacentValues(coordinate, direction: direction).max() else {
            return true
        }
        return self[coordinate] > minAdjacentValue
    }
    
    func isGreaterThanAdjacentValues(_ coordinate: Coordinate) -> Bool {
        Direction.allCases.contains { direction in
            isGreaterThanAdjacentValues(coordinate, direction: direction)
        }
    }
    
    func numSmallerAdjacentValues(_ coordinate: Coordinate, direction: Direction) -> Int {
        let adj = adjacentValues(coordinate, direction: direction)
        let ret = adj.enumerated()
            .first {
                $0.element >= self[coordinate]
            }?.offset
        return ret.map { $0 + 1 } ?? adj.count
    }
    
    func smallerAdjacentValuesCounts(_ coordinate: Coordinate) -> [Int] {
        Direction.allCases.map { direction in
            numSmallerAdjacentValues(coordinate, direction: direction)
        }
    }
    
    func smallerAdjacentValuesProduct(_ coordinate: Coordinate) -> Int {
        smallerAdjacentValuesCounts(coordinate).reduce(1, *)
    }
}
