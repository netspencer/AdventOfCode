import Algorithms
import Foundation
import Utils

@main
struct Day5: Exercise {
    let cargoShip: CargoShip
    let instructions: [Instruction]
    
    init(input: Input) {
        let (cargoShipInput, instructionsInput) = input.rawValue
            .components(separatedBy: "\n\n")
            .splat()
        self.cargoShip = CargoShip.parse(cargoShipInput)
        self.instructions = instructionsInput.split(separator: "\n")
            .map(Instruction.parse)
    }
    
    var partOne: String {
        instructions
            .reduce(into: cargoShip) { $0.execute($1, isReversed: true) }
            .message
    }
    
    var partTwo: String {
        instructions
            .reduce(into: cargoShip) { $0.execute($1, isReversed: false) }
            .message
    }
}
