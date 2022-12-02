enum Move: Int {
    case rock, paper, scissors
    
    var score: Int {
        rawValue + 1
    }
    
    var winningMove: Move {
        Move(rawValue: (rawValue + 1) % 3)!
    }
    
    func move(forOutcome outcome: Outcome) -> Move {
        switch outcome {
        case .lose: return winningMove.winningMove
        case .draw: return self
        case .win: return winningMove
        }
    }
    
    func outcome(forMove move: Move) -> Outcome {
        guard self != move else { return .draw }
        guard move == winningMove else { return .lose }
        return .win
    }
}
