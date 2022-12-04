extension RangePair {
    static func parse(_ input: String) -> Self {
        let ranges = input.split(separator: ",")
        return self.init(
            firstElf: .parse(ranges[0]),
            secondElf: .parse(ranges[1])
        )
    }
}

extension ClosedRange where Bound == Int {
    static func parse(_ input: Substring) -> Self {
        let bounds = input.split(separator: "-")
        guard let lower = Int(bounds[0]), let upper = Int(bounds[1]) else {
            fatalError()
        }
        return self.init(uncheckedBounds: (lower: lower, upper: upper))
    }
}
