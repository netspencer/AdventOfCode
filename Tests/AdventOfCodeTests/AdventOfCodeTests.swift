import XCTest
import Utils

@testable import Day1
@testable import Day2
@testable import Day3
@testable import Day4
@testable import Day5
@testable import Day6
@testable import Day7
@testable import Day8
@testable import Day9
@testable import Day10
@testable import Day11

final class AdventOfCodeTests: XCTestCase {
    func testDay1() {
        measure {
            expectExerciseOutput(
                exercise: Day1(input: input(forDay: 1)),
                partOne: "67450",
                partTwo: "199357"
            )
        }
    }
    
    func testDay2() {
        measure {
            expectExerciseOutput(
                exercise: Day2(input: input(forDay: 2)),
                partOne: "11449",
                partTwo: "13187"
            )
        }
    }
    
    func testDay3() {
        measure {
            expectExerciseOutput(
                exercise: Day3(input: input(forDay: 3)),
                partOne: "7917",
                partTwo: "2585"
            )
        }
    }
    
    func testDay4() {
        measure {
            expectExerciseOutput(
                exercise: Day4(input: input(forDay: 4)),
                partOne: "456",
                partTwo: "808"
            )
        }
    }

    func testDay5() {
        measure {
            expectExerciseOutput(
                exercise: Day5(input: input(forDay: 5)),
                partOne: "TGWSMRBPN",
                partTwo: "TZLTLWRNF"
            )
        }
    }
    
    func testDay6() {
        measure {
            expectExerciseOutput(
                exercise: Day6(input: input(forDay: 6)),
                partOne: "1100",
                partTwo: "2421"
            )
        }
    }
    
    func testDay7() {
        measure {
            expectExerciseOutput(
                exercise: Day7(input: input(forDay: 7)),
                partOne: "1232307",
                partTwo: "7268994"
            )
        }
    }

    func testDay8() {
        measure {
            expectExerciseOutput(
                exercise: Day8(input: input(forDay: 8)),
                partOne: "1805",
                partTwo: "444528"
            )
        }
    }
    
    func testDay9() {
        measure {
            expectExerciseOutput(
                exercise: Day9(input: input(forDay: 9)),
                partOne: "5878",
                partTwo: "2405"
            )
        }
    }
    
    func testDay10() {
        measure {
            expectExerciseOutput(
                exercise: Day10(input: input(forDay: 10)),
                partOne: "15260",
                partTwo: """
                ###...##..#..#.####..##..#....#..#..##..
                #..#.#..#.#..#.#....#..#.#....#..#.#..#.
                #..#.#....####.###..#....#....#..#.#....
                ###..#.##.#..#.#....#.##.#....#..#.#.##.
                #....#..#.#..#.#....#..#.#....#..#.#..#.
                #.....###.#..#.#.....###.####..##...###.
                """
            )
        }
    }
    
    func testDay11() {
        measure {
            expectExerciseOutput(
                exercise: Day11(input: input(forDay: 11)),
                partOne: "182293",
                partTwo: "54832778815"
            )
        }
    }
}

func expectExerciseOutput(exercise: Exercise, partOne: String, partTwo: String) {
    XCTAssertEqual(
        exercise.partOne.trimmingCharacters(in: .newlines),
        partOne.trimmingCharacters(in: .newlines)
    )
    XCTAssertEqual(
        exercise.partTwo.trimmingCharacters(in: .newlines),
        partTwo.trimmingCharacters(in: .newlines)
    )
}

func input(forDay day: Int) -> Input {
    let inputDir = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let inputFile = inputDir.appendingPathComponent("Inputs/day\(day).txt")
    return try! Input(fromFile: inputFile)
}
