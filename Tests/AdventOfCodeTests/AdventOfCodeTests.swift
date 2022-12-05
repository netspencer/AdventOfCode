import XCTest
import Utils

@testable import Day1
@testable import Day2
@testable import Day3
@testable import Day4
@testable import Day5

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
    
    func testDay3() throws {
        expectExerciseOutput(
            exercise: Day3(input: try input(forDay: 3)),
            partOne: "7917",
            partTwo: "2585"
        )
    }
    
    func testDay4() throws {
        expectExerciseOutput(
            exercise: Day4(input: try input(forDay: 4)),
            partOne: "456",
            partTwo: "808"
        )
    }

    func testDay5() throws {
        expectExerciseOutput(
            exercise: Day5(input: try input(forDay: 5)),
            partOne: "TGWSMRBPN",
            partTwo: "TZLTLWRNF"
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
