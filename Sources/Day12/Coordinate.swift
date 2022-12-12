struct Coordinate: Hashable {
    let row: Int
    let column: Int
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
    
    static let zero = Coordinate(row: 0, column: 0)
    
    var up: Coordinate {
        Coordinate(row: row - 1, column: column)
    }
    
    var down: Coordinate {
        Coordinate(row: row + 1, column: column)
    }
    
    var left: Coordinate {
        Coordinate(row: row, column: column - 1)
    }
    
    var right: Coordinate {
        Coordinate(row: row, column: column + 1)
    }
}
