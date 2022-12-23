import Foundation
import Utils

@main
struct Day22: Exercise {
    let jungle: Jungle
    
    init(input: Input) {
        self.jungle = .parse(input)
    }
    
    var partOne: String {
        jungle.finalPassword.description
    }
    
    var partTwo: String {
        jungle.finalPasswordCube.description
    }
}
