import Foundation

struct Item: RawRepresentable, Hashable {
    let rawValue: Character
    
    var priority: Int {
        return Int(rawValue.asciiValue!) - (rawValue.isUppercase ? 38 : 96)
    }
}
