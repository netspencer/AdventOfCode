extension Rucksack {
    static func parse(_ input: String) -> Self {
        self.init(
            firstCompartment: Set(fromInput: input.prefix(input.count / 2)),
            secondCompartment: Set(fromInput: input.suffix(input.count / 2))
        )
    }
}

extension Set where Element == Item {
    init(fromInput input: some StringProtocol) {
        self.init(input.map(Item.init(rawValue:)))
    }
}
