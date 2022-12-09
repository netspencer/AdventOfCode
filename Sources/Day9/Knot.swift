struct Knot: Hashable {
    var x: Int
    var y: Int
    static let zero = Knot(x: 0, y: 0)
        
    func isAdjacent(_ other: Knot) -> Bool {
        guard self != other else { return true }
        return abs(x - other.x) <= 1 && abs(y - other.y) <= 1
    }
    
    mutating func move(direction: Direction) {
        switch direction {
        case .up: y += 1
        case .down: y -= 1
        case .left: x -= 1
        case .right: x += 1
        }
    }
    
    mutating func move(towards other: Knot) {
        guard !isAdjacent(other) else { return }
        x = other.x - (other.x - x) / 2
        y = other.y - (other.y - y) / 2
    }
}
