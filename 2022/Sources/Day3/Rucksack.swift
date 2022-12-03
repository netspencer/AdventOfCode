struct Rucksack {
    let firstCompartment: Set<Item>
    let secondCompartment: Set<Item>
    
    var combinedCompartmentContents: Set<Item> {
        firstCompartment.union(secondCompartment)
    }
    
    var commonOccuringItem: Item {
        firstCompartment.intersection(secondCompartment).first!
    }
    
    var priority: Int {
        commonOccuringItem.priority
    }
}

// - MARK: Parse

extension Rucksack {
    init(_ input: String) {
        self.firstCompartment = Set(fromInput: input.prefix(input.count / 2))
        self.secondCompartment = Set(fromInput: input.suffix(input.count / 2))
    }
}
