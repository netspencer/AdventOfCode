import Foundation

extension Array where Element == Int {
    public var sum: Int {
        reduce(0, +)
    }
}
