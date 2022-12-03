struct Rucksack {
    let firstCompartment: Set<Item>
    let secondCompartment: Set<Item>
    
    var allItems: Set<Item> {
        firstCompartment.union(secondCompartment)
    }
    
    var redundantItem: Item {
        firstCompartment.intersection(secondCompartment).first!
    }
}

extension Collection where Element == Rucksack {
    var badge: Item {
        reduce(
            Set(first!.allItems),
            { $0.intersection($1.allItems) }
        ).first!
    }
}

// - MARK: Parse

extension Rucksack {
    init(_ input: String) {
        self.firstCompartment = Set(fromInput: input.prefix(input.count / 2))
        self.secondCompartment = Set(fromInput: input.suffix(input.count / 2))
    }
}
