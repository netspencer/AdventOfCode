import Foundation

extension Character {
    public func difference(_ other: Character) -> Int {
        guard let asciiOther = other.asciiValue else { return -1 }
        guard let ascii = asciiValue else { return -1 }
        return Int(asciiOther) - Int(ascii)
    }
}
