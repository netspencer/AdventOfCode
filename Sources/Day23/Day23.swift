import Foundation
import Utils

@main
struct Day23: Exercise {
    let grove: Grove
    
    init(input: Input) {
        self.grove = .parse(input)
        dump(grove)
    }
}
