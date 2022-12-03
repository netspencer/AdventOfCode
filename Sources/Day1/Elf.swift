struct Elf: Comparable {
    let itemCalories: [Int]
    
    var totalCalories: Int {
        itemCalories.sum
    }
    
    static func < (lhs: Elf, rhs: Elf) -> Bool {
        lhs.totalCalories < rhs.totalCalories
    }
}
