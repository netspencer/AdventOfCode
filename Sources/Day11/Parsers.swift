import Foundation

extension Monkey {
    static func parse(_ input: String) -> Monkey {
        let lines = input.components(separatedBy: .newlines)
        return Monkey(
            items: lines[1]
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .dropFirst("Starting items: ".count)
                .components(separatedBy: ", ")
                .map { Int($0)! },
            operation: Operations.parse(
                lines[2]
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .dropFirst("Operation: ".count)
            ),
            test: Int(lines[3]
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .dropFirst("Test: divisible by ".count))!,
            monkeyIfTrue: parseThrowToMonkeyIfCondition(
                lines[4]
                    .trimmingCharacters(in: .whitespacesAndNewlines)
            ),
            monkeyIfFalse: parseThrowToMonkeyIfCondition(
                lines[5]
                    .trimmingCharacters(in: .whitespacesAndNewlines)
            )
        )
    }
}

extension Operations {
    static func parse(_ input: Substring) -> Operation {
        let parts = input.dropFirst("new = old ".count)
            .split(separator: " ")
        switch (parts[0], parts[1]) {
        case let ("+", val):
            return Operations.add(Int(val)!)
        case ("*", "old"):
            return Operations.cube
        case let ("*", val):
            return Operations.multiply(Int(val)!)
        default:
            fatalError()
        }
    }
}

func parseThrowToMonkeyIfCondition(_ input: String) -> Int {
    Int(input.components(separatedBy: ": throw to monkey ")[1])!
}
