import Foundation

enum Direction {
    case up, down, left, right
    
    var score: Int {
        switch self {
        case .up: return 3
        case .down: return 1
        case .left: return 2
        case .right: return 0
        }
    }
    
    mutating func rotate(towards other: Direction) {
        switch other {
        case .up, .down: return
        case .left:
            switch self {
            case .up: self = .left
            case .down: self = .right
            case .left: self = .down
            case .right: self = .up
            }
            
        case .right:
            switch self {
            case .up: self = .right
            case .down: self = .left
            case .left: self = .up
            case .right: self = .down
            }
        }
    }
}
