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

extension Exercise {
    public static func main() throws {
        let exercise = self.init(input: Input())
        if !exercise.partOne.isEmpty {
            print("partOne: \(exercise.partOne)")
        }
        if !exercise.partTwo.isEmpty {
            print("partTwo: \(exercise.partTwo)")
        }
    }
}
