import Foundation

extension Array where Element == Int {
    public var sum: Int {
        reduce(0, +)
    }
}

extension Bool {
    public var intValue: Int {
        self ? 1 : 0
    }
}
