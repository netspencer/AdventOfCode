enum Outcome: Int {
    case lose, draw, win
    
    var score: Int {
        rawValue * 3
    }
}
