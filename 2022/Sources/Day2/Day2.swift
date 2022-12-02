import Utils

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
