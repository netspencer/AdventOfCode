import Algorithms
import Foundation
import Utils

extension Jungle {
    static func parse(_ input: Input) -> Jungle {
        let (mapInput, instructionInput) = input.rawValue.components(separatedBy: "\n\n").splat()
        return Jungle(
            instructions: Instructions.parse(instructionInput),
            grid: Grid.parse(mapInput)
        )
    }
}

enum Grid {
    static func parse(_ input: String) -> [Point: Tile] {
        input
            .split(separator: "\n")
            .enumerated()
            .reduce(into: [Point: Tile]()) { grid, tuple in
                let (y, line) = tuple
                for (x, char) in line.enumerated() {
                    guard let tile = Tile.parse(char) else { continue }
                    grid[Point(x: x, y: y)] = tile
                }
            }
    }
}

enum Instructions {
    static func parse(_ input: String) -> [Instruction] {
        input
            .chunked(on: \.isWholeNumber)
            .lazy
            .map(\.1)
            .compactMap(Instruction.parse)
    }
}

extension Instruction {
    static func parse(_ input: Substring) -> Instruction? {
        if let number = Int(input) {
            return .move(number)
        } else if let direction = Direction.parse(input) {
            return .turn(direction)
        } else {
            return nil
        }
    }
}

extension Direction {
    static func parse(_ input: Substring) -> Direction? {
        switch input {
        case "L": return .left
        case "R": return .right
        default: return nil
        }
    }
}

extension Tile {
    static func parse(_ input: Character) -> Tile? {
        switch input {
        case ".": return .open
        case "#": return .wall
        default: return nil
        }
    }
}
