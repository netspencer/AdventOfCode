import Utils

extension HeightMap {
    static func parse(_ input: Input) -> HeightMap {
        var start = Coordinate.zero
        var end = Coordinate.zero
        let grid = input.lines.enumerated().map { (row, line) in
            line.enumerated().map { (column, char) -> Character in
                if char == "S" {
                    start = Coordinate(row: row, column: column)
                    return "a"
                } else if char == "E" {
                    end = Coordinate(row: row, column: column)
                    return "z"
                } else {
                    return char
                }
            }
        }
        
        return HeightMap(
            grid: grid,
            start: start,
            end: end
        )
    }
}
