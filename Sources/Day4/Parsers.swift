extension RangePair {
    static func parse(_ input: String) -> Self {
        let ranges = input.split(separator: ",").map(ClosedRange.parse)
        precondition(ranges.count == 2)
        return self.init(
            firstElf: ranges[0],
            secondElf: ranges[1]
        )
    }
}

extension ClosedRange where Bound == Int {
    static func parse(_ input: Substring) -> Self {
        let bounds = input.split(separator: "-").compactMap { Int($0) }
        precondition(bounds.count == 2)
        return self.init(uncheckedBounds: (lower: bounds[0], upper: bounds[1]))
    }
}
