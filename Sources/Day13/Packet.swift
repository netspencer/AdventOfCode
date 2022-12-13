import Algorithms
import Foundation
import Utils

enum Packet {
    case list([Packet])
    case integer(Int)
}

extension Packet: Comparable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return compare(left: lhs, right: rhs) == .orderedSame
    }
    static func < (lhs: Self, rhs: Self) -> Bool {
        return compare(left: lhs, right: rhs) == .orderedAscending
    }
    static func > (lhs: Self, rhs: Self) -> Bool {
        return compare(left: lhs, right: rhs) == .orderedDescending
    }

    static func compare(left: Packet, right: Packet) -> ComparisonResult {
        switch (left, right) {
        case let (.list(l), .list(r)):
            for pair in zip(l, r) {
                let comparison = compare(left: pair.0, right: pair.1)
                if comparison != .orderedSame {
                    return comparison
                }
            }
            if l.count < r.count { return .orderedAscending }
            if l.count > r.count { return .orderedDescending }
            return .orderedSame

        case let (.integer(l), .integer(r)):
            return l < r ? .orderedAscending : l > r ? .orderedDescending : .orderedSame

        case (.list, .integer):
            return compare(left: left, right: .list([right]))

        case (.integer, .list):
            return compare(left: .list([left]), right: right)
        }
    }
}
