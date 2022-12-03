extension Round {
    static func parse(partOne input: String) -> Self {
        let characters = Array(input)
        return self.init(
            opponentMove: Move.parse(characters[0]),
            playerMove: Move.parse(characters[2])
        )
    }
    
    static func parse(partTwo input: String) -> Self {
        let characters = Array(input)
        return self.init(
            opponentMove: Move.parse(characters[0]),
            outcome: Outcome.parse(characters[2])
        )
    }
}

extension Move {
    static func parse(_ input: Character) -> Self {
        switch input {
        case "A", "X": return .rock
        case "B", "Y": return .paper
        case "C", "Z": return .scissors
        default: fatalError()
        }
    }
}

extension Outcome {
    static func parse(_ input: Character) -> Self {
        switch input {
        case "X": return .lose
        case "Y": return .draw
        case "Z": return .win
        default: fatalError()
        }
    }
}
