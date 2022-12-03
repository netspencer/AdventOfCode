struct Group {
    let rucksacks: [Rucksack]
        
    var badge: Item {
        rucksacks
            .map(\.combinedCompartmentContents)
            .reduce(rucksacks.first!.combinedCompartmentContents) { partialResult, next in
                partialResult.intersection(next)
            }
            .first!
    }
    
    var priority: Int {
        badge.priority
    }
}
