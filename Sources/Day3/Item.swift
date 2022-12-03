import Foundation

struct Item: RawRepresentable, Hashable {
    let rawValue: Character
    
    var priority: Int {
        return Int(rawValue.asciiValue!) - (rawValue.isUppercase ? 38 : 96)
    }
}

extension Set where Element == Item {
    init(fromInput input: some StringProtocol) {
        self.init(input.map(Item.init(rawValue:)))
    }
}
