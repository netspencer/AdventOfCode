struct CPU {
    let cycle: Int
    let x: Int
}

extension CPU {
    var signalStrength: Int {
        cycle * x
    }
    
    var pixel: Character {
        (x-1...x+1).contains((cycle - 1) % 40) ? "#" : "."
    }
}
