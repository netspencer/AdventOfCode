import Foundation

public protocol Exercise {
    init(input: Input)
    var partOne: String { get }
    var partTwo: String { get }
}

extension Exercise {
    public var partOne: String { "" }
    public var partTwo: String { "" }
}

typealias TerminalStyleCode = (open: String, close: String)
let red: TerminalStyleCode = ("\u{001B}[31m", "\u{001B}[0m")
let green: TerminalStyleCode = ("\u{001B}[32m", "\u{001B}[0m")

extension Exercise {
    public static func main() throws {
        let exercise = self.init(input: Input())
        if !exercise.partOne.isEmpty {
            print("\(red.open)partOne\(red.close)\n\(exercise.partOne)")
        }
        if !exercise.partTwo.isEmpty {
            print("\(green.open)partTwo\(green.close)\n\(exercise.partTwo)")
        }
    }
}
