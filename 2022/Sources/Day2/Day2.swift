import Utils
import Foundation

enum Outcome: Int {
    case lose, draw, win
    
    var score: Int {
        rawValue * 3
    }
}

@main
struct Day2: Exercise {
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var partOne: String {
        input.lines
            .map(Round.init(partOneInput:))
            .map(\.score)
            .sum
            .description
    }
    
    var partTwo: String {
        input.lines
            .map(Round.init(partTwoInput:))
            .map(\.score)
            .sum
            .description
    }
}

// - MARK: Parse

extension Round {
    init(partOneInput inputLine: String) {
        let characters = Array(inputLine)
        self.init(
            opponentMove: Move(characters[0]),
            playerMove: Move(characters[2])
        )
    }
    
    init(partTwoInput inputLine: String) {
        let characters = Array(inputLine)
        self.init(
            opponentMove: Move(characters[0]),
            outcome: Outcome(characters[2])
        )
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
