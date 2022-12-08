import Utils

extension Grid where Value == Int {
    static func parse(_ input: Input) -> Grid {
        Grid(
            rows: input.lines.count,
            columns: input.lines[0].count,
            values: input.lines.map { line in
                line.map { Int(String($0))! }
            }
        )
    }
}
