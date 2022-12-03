extension Elf {
    static func parse(_ input: String) -> Self {
        self.init(
            itemCalories: input
                .split(separator: "\n")
                .compactMap { Int($0) }
        )
    }
}
