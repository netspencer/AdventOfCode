struct Instruction {
    enum Direction {
        case up, down, left, right
    }
    
    let direction: Direction
    let steps: Int
}
