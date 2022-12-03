enum Outcome: Int {
    case lose, draw, win
    
    var score: Int {
        rawValue * 3
    }
}

// - MARK: Parse

extension Outcome {
    init(_ inputChar: Character) {
        switch inputChar {
        case "X": self = .lose
        case "Y": self = .draw
        case "Z": self = .win
        default: fatalError()
        }
    }
}
