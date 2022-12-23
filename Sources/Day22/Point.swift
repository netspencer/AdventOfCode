import Foundation

struct Point: Hashable, CustomStringConvertible {
    typealias X = Int
    typealias Y = Int
    
    var x: X
    var y: Y
    
    init(x: X, y: Y) {
        self.x = x
        self.y = y
    }
    
    static let zero = Point(x: 0, y: 0)
    
    func moving(_ direction: Direction, count: Int = 1) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y - count)
        case .down: return Point(x: x, y: y + count)
        case .left: return Point(x: x - count, y: y)
        case .right: return Point(x: x + count, y: y)
        }
    }
    
    func wrapping(in grid: [Point: Tile], moving direction: Direction) -> Point {
        var newPoint = self
        switch direction {
        case .up:
            newPoint.y = grid.yRange(forX: x).upperBound
        case .down:
            newPoint.y = grid.yRange(forX: x).lowerBound
        case .left:
            newPoint.x = grid.xRange(forY: y).upperBound
        case .right:
            newPoint.x = grid.xRange(forY: y).lowerBound
        }
        return newPoint
    }
    
    func transitioningCube(in grid: [Point: Tile], moving direction: Direction) -> (Point, Direction) {
        let edgeSize = (grid.xRange(forY: 0).upperBound + 1) / 3
        
        var newPosition = self
        newPosition.x = newPosition.x + 1
        newPosition.y = newPosition.y + 1
        
        var newDirection: Direction
        
        if newPosition.x > edgeSize*2 {
            switch direction {
            case .right:
                newPosition.x = edgeSize*2
                newPosition.y = (edgeSize*3)+1 - newPosition.y
                newDirection = .left
            case .down:
                newPosition.y = newPosition.x - edgeSize
                newPosition.x = edgeSize*2
                newDirection = .left
            case .up:
                newPosition.x = newPosition.x - edgeSize*2
                newPosition.y = edgeSize*4
                newDirection = .up
            case .left:
                fatalError()
            }
        } else if newPosition.y <= edgeSize {
            switch direction {
            case .up:
                newPosition.y = newPosition.x + edgeSize*2
                newPosition.x = 1
                newDirection = .right
            case .left:
                newPosition.y = (edgeSize*3)+1 - newPosition.y
                newPosition.x = 1
                newDirection = .right
            case .down, .right:
                fatalError()
            }
        } else if newPosition.y <= edgeSize*2 {
            switch direction {
            case .left:
                newPosition.x = newPosition.y - edgeSize
                newPosition.y = (edgeSize*2)+1
                newDirection = .down
            case .right:
                newPosition.x = newPosition.y + edgeSize
                newPosition.y = edgeSize
                newDirection = .up
            case .up, .down:
                fatalError()
            }
        } else if newPosition.x > edgeSize {
            switch direction {
            case .right:
                newPosition.x = edgeSize*3
                newPosition.y = (edgeSize*3)+1 - newPosition.y
                newDirection = .left
            case .down:
                newPosition.y = newPosition.x + edgeSize*2
                newPosition.x = edgeSize
                newDirection = .left
            case .up, .left:
                fatalError()
            }
        } else if newPosition.y <= edgeSize*3 {
            switch direction {
            case .up:
                newPosition.y = newPosition.x + edgeSize
                newPosition.x = edgeSize+1
                newDirection = .right
            case .left:
                newPosition.x = edgeSize+1
                newPosition.y = (edgeSize*3)+1 - newPosition.y
                newDirection = .right
            case .right, .down:
                fatalError()
            }
        } else {
            switch direction {
            case .left:
                newPosition.x = newPosition.y - edgeSize*2
                newPosition.y = 1
                newDirection = .down
            case .right:
                newPosition.x = newPosition.y - edgeSize*2
                newPosition.y = edgeSize*3
                newDirection = .up
            case .down:
                newPosition.x += edgeSize*2
                newPosition.y = 1
                newDirection = .down
            case .up:
                fatalError()
            }
        }
        
        newPosition.x = newPosition.x - 1
        newPosition.y = newPosition.y - 1

        return (newPosition, newDirection)
    }
    
    var description: String {
        "(x: \(x), y: \(y))"
    }
}

extension Dictionary<Point, Tile> {
    func xRange(forY y: Point.Y) -> ClosedRange<Point.X> {
        let xs = keys.filter { $0.y == y }.map(\.x)
        return xs.min()! ... xs.max()!
    }
    
    func yRange(forX x: Point.X) -> ClosedRange<Point.Y> {
        let ys = keys.filter { $0.x == x }.map(\.y)
        return ys.min()! ... ys.max()!
    }
}
