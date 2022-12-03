struct Rucksack {
    let firstCompartment: Set<Character>
    let secondCompartment: Set<Character>
    
    var combinedCompartmentContents: Set<Character> {
        firstCompartment.union(secondCompartment)
    }
    
    var commonOccuringItem: Character {
        firstCompartment.intersection(secondCompartment).first!
    }
    
    var priority: Int {
        commonOccuringItem.priority
    }
}

// - MARK: Parse

extension Rucksack {
    init(_ inputLine: String) {
        let middleIndex = inputLine.index(inputLine.startIndex, offsetBy: inputLine.count / 2)
        self.firstCompartment = Set(inputLine[inputLine.startIndex..<middleIndex])
        self.secondCompartment = Set(inputLine[middleIndex...])
    }
}

