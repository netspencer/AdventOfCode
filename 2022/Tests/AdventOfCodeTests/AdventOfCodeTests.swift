import XCTest
import Utils

@testable import Day1
@testable import Day2

final class AdventOfCodeTests: XCTestCase {
    func testDay1() throws {
        expectExerciseOutput(
            exercise: Day1(input: try input(forDay: 1)),
            partOne: "67450",
            partTwo: "199357"
        )
    }
    
    func testDay2() throws {
        expectExerciseOutput(
            exercise: Day2(input: try input(forDay: 2)),
            partOne: "11449",
            partTwo: "13187"
        )
    }
}

func expectExerciseOutput(exercise: Exercise, partOne: String, partTwo: String) {
    XCTAssertEqual(exercise.partOne, partOne)
    XCTAssertEqual(exercise.partTwo, partTwo)
}

func input(forDay day: Int) throws -> Input {
    let inputDir = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let inputFile = inputDir.appendingPathComponent("Inputs/day\(day).txt")
    return try Input(fromFile: inputFile)
}
