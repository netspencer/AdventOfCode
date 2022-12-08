import Utils

extension Forrest {
    static func parse(_ input: Input) -> Forrest {
        Forrest(
            rows: input.lines.count,
            columns: input.lines[0].count,
            heights: input.lines.map { line in
                line.map { Int(String($0))! }
            }
        )
    }
}
