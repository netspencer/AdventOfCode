import Algorithms
import ArgumentParser
import Utils
import Foundation

struct Round {
    let opponentMove: Move
    let playerMove: Move
            
    var outcome: Outcome {
        switch (opponentMove, playerMove) {
        case (.rock, .rock): return .draw
        case (.rock, .paper): return .win
        case (.rock, .scissors): return .lose
        case (.paper, .rock): return .lose
        case (.paper, .paper): return .draw
        case (.paper, .scissors): return .win
        case (.scissors, .rock): return .win
        case (.scissors, .paper): return .lose
        case (.scissors, .scissors): return .draw
        }
    }
    
    var score: Int {
        playerMove.score + outcome.score
    }
}

enum Move {
    case rock, paper, scissors
        
    var score: Int {
        switch self {
        case .rock: return 1
        case .paper: return 2
        case .scissors: return 3
        }
    }
    
    func move(forOutcome outcome: Outcome) -> Move {
        switch (self, outcome) {
        case (.rock, .lose): return .scissors
        case (.rock, .draw): return .rock
        case (.rock, .win): return .paper
        case (.paper, .lose): return .rock
        case (.paper, .draw): return .paper
        case (.paper, .win): return .scissors
        case (.scissors, .lose): return .paper
        case (.scissors, .draw): return .scissors
        case (.scissors, .win): return .rock
        }
    }
}


enum Outcome {
    case lose, draw, win
    
    var score: Int {
        switch self {
        case .lose: return 0
        case .draw: return 3
        case .win: return 6
        }
    }
}

@main
struct Day2: ParsableCommand {
    func run() throws {
        let input = Input()
        
        let part1 = input.lines.map(Round.init(partOneInput:)).map(\.score).reduce(0, +)
        print("part1: \(part1)")
        
        let part2 = input.lines.map(Round.init(partTwoInput:)).map(\.score).reduce(0, +)
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
        case "A", "X":
            self = .rock
        case "B", "Y":
            self = .paper
        case "C", "Z":
            self = .scissors
        default:
            fatalError()
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
