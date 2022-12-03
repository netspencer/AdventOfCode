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
