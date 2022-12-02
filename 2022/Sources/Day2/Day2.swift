import ArgumentParser
import Utils
import Foundation

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

struct Round {
    let opponentMove: Move
    let playerMove: Move
    
    var outcome: Outcome {
        opponentMove.outcome(forMove: playerMove)
    }
    
    var score: Int {
        playerMove.score + outcome.score
    }
}

enum Outcome: Int {
    case lose, draw, win
    
    var score: Int {
        rawValue * 3
    }
}

@main
struct Day2: ParsableCommand {
    func run() throws {
        let input = Input()
        
        let part1 = input.lines
            .map(Round.init(partOneInput:))
            .map(\.score)
            .sum
        print("part1: \(part1)")
        
        let part2 = input.lines
            .map(Round.init(partTwoInput:))
            .map(\.score)
            .sum
        print("part2: \(part2)")
    }
}

// - MARK: Parse

extension Round {
    init(partOneInput inputLine: String) {
        let characters = Array(inputLine)
        self.opponentMove = Move(characters[0])
        self.playerMove = Move(characters[2])
    }
    
    init(partTwoInput inputLine: String) {
        let characters = Array(inputLine)
        self.opponentMove = Move(characters[0])
        self.playerMove = self.opponentMove.move(forOutcome: Outcome(characters[2]))
    }
}

extension Move {
    init(_ inputChar: Character) {
        switch inputChar {
        case "A", "X": self = .rock
        case "B", "Y": self = .paper
        case "C", "Z": self = .scissors
        default: fatalError()
        }
    }
}

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
