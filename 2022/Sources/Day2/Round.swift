struct Round {
    let opponentMove: Move
    let playerMove: Move
    let outcome: Outcome
    
    init(opponentMove: Move, playerMove: Move) {
        self.opponentMove = opponentMove
        self.playerMove = playerMove
        self.outcome = opponentMove.outcome(forMove: playerMove)
    }
    
    init(opponentMove: Move, outcome: Outcome) {
        self.opponentMove = opponentMove
        self.playerMove = opponentMove.move(forOutcome: outcome)
        self.outcome = outcome
    }
    
    var score: Int {
        playerMove.score + outcome.score
    }
}
