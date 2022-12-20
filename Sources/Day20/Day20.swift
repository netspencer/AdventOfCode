import Foundation
import Utils

let decryptionKey = 811589153

func decrypt(_ number: Int) -> Int {
    number * decryptionKey
}

@main
struct Day20: Exercise {
    let numbers: [Int]
    
    init(input: Input) {
        self.numbers = input.lines.map { Int($0)! }
    }
    
    var partOne: String {
        let list = Node.fromArray(numbers)
        list.asQueue().mix()
        return list.groveCoordinates.sum.description
    }
    
    var partTwo: String {
        let list = Node.fromArray(numbers.map(decrypt))
        list.asQueue().mix(times: 10)
        return list.groveCoordinates.sum.description
    }
}
