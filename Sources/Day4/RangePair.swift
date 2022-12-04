struct RangePair {
    let firstElf: ClosedRange<Int>
    let secondElf: ClosedRange<Int>
    
    var isContained: Bool {
        firstElf.contains(secondElf) || secondElf.contains(firstElf)
    }
    
    var isOverlapping: Bool {
        firstElf.overlaps(secondElf)
    }
}

extension ClosedRange {
    func contains(_ other: ClosedRange) -> Bool {
        other.clamped(to: self) == other
    }
}
