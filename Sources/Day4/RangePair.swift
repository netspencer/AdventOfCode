struct RangePair {
    let firstElf: ClosedRange<Int>
    let secondElf: ClosedRange<Int>
    
    var oneFullyContainsOther: Bool {
        firstElf.clamped(to: secondElf) == firstElf
            || secondElf.clamped(to: firstElf) == secondElf
    }
    
    var oneOverlapsOther: Bool {
        firstElf.overlaps(secondElf) || secondElf.overlaps(firstElf)
    }
}
