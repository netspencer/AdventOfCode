struct CargoShip {
    var cargo: [[Character]]
    
    var message: String {
        String(cargo.compactMap(\.last))
    }
    
    mutating func execute(_ instruction: Instruction, isReversed: Bool) {
        let source = cargo[instruction.from - 1]
        let liftedContents = source.suffix(instruction.count)
        
        if isReversed {
            cargo[instruction.to - 1]
                .append(contentsOf: liftedContents.reversed())
        } else {
            cargo[instruction.to - 1]
                .append(contentsOf: liftedContents)
        }

        cargo[instruction.from - 1].removeLast(instruction.count)
    }
}
