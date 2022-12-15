import Algorithms
import Foundation
import Utils

extension ClosedRange<Int> {
	func clamped(to other: ClosedRange) -> ClosedRange? {
		guard overlaps(other) else { return nil }
		return Swift.max(lowerBound, other.lowerBound) ... Swift.min(upperBound, other.upperBound)
	}
	
	func union(with other: ClosedRange<Int>) -> ClosedRange<Int>? {
		if self.overlaps(other) || self.upperBound == other.lowerBound - 1 || self.lowerBound == other.upperBound + 1 {
			return Swift.min(lowerBound, other.lowerBound) ... Swift.max(upperBound, other.upperBound)
		}
		return nil
	}
}

extension Set where Element == ClosedRange<Int> {
	func fused() -> Self {
		for e1 in self {
			for e2 in self {
				if e1 == e2 { continue }
				if let union = e1.union(with: e2) {
					var copy = self
					copy.remove(e1)
					copy.remove(e2)
					copy.insert(union)
					return copy.fused()
				}
			}
		}
		
		return self
	}
}