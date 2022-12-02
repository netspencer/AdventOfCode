struct Elf: Comparable {
    let itemCalories: [Int]
    
    var totalCalories: Int {
        itemCalories.sum
    }
    
    static func < (lhs: Elf, rhs: Elf) -> Bool {
        lhs.totalCalories < rhs.totalCalories
    }
}

// - MARK: Parse

extension Elf {
    init(_ input: String) {
        self.itemCalories = input
            .split(separator: "\n")
            .compactMap { Int($0) }
    }
}
