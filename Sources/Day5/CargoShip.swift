struct CargoShip {
    var cargo: [[Character]]
    
    var message: String {
        String(cargo.compactMap(\.last))
    }
    
    mutating func execute(_ instruction: Instruction, isReversed: Bool) {
        let source = cargo[instruction.sourceStack - 1]
        let liftedContents = source.suffix(instruction.quantity)
        
        if isReversed {
            cargo[instruction.destinationStack - 1]
                .append(contentsOf: liftedContents.reversed())
        } else {
            cargo[instruction.destinationStack - 1]
                .append(contentsOf: liftedContents)
        }

        cargo[instruction.sourceStack - 1].removeLast(instruction.quantity)
    }
}
