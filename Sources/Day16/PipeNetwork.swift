import Algorithms
import Foundation
import SwiftGraph
import Collections
import Utils

struct PipeNetwork {
    struct Valve: Equatable, Codable {
        let name: String
        let pressure: Int
    }
    
    struct State {
        var position: String
        var opened: [(Valve, Int)]
        var timeElapsed: Int
        var remaining: [Valve]
        
        init(position: String, remaining: [Valve]) {
            self.position = position
            self.opened = []
            self.timeElapsed = 0
            self.remaining = remaining.sorted(by: { $0.pressure > $1.pressure })
        }
        
        var pressureReleased: Int {
            opened
                .map { valve, openedSince in
                    (30 - openedSince) * valve.pressure
                }
                .sum
        }
        
        var potentialPressure: Int {
            let remainingPressure = remaining
                .prefix((30 - timeElapsed) / 2)
                .enumerated()
                .map { index, valve in
                    (30 - timeElapsed - 2 * (1 + index)) * valve.pressure
                }
                .sum
            return pressureReleased + remainingPressure
        }
    }

    let graph: UnweightedGraph<Valve>
    let shortestPaths: [[Int]]
    
    init(graph: UnweightedGraph<Valve>) {
        self.graph = graph
        self.shortestPaths = graph.computeShortestPaths()
    }
    
    func shortestPath(from: String, to: String) -> Int? {
        guard let fromIndex = graph.index(for: from) else { return nil }
        guard let toIndex = graph.index(for: to) else { return nil }
        return shortestPaths[fromIndex][toIndex]
    }
    
    var maximumPressure: Int {
        let initialState = State(position: "AA", remaining: graph.vertices)
        var best = initialState
        
        var queue = Deque<State>([initialState])
        
        while let state = queue.popFirst() {
            guard state.potentialPressure > best.pressureReleased else { continue }
            if state.pressureReleased > best.pressureReleased {
                best = state
            }
            
            for remaining in state.remaining {
                guard let distanceToValve = shortestPath(from: state.position, to: remaining.name) else {
                    continue
                }
                let valveOpenedAt = state.timeElapsed + distanceToValve + 1
                guard valveOpenedAt < 30 else { continue }
                
                var opened = state.opened
                opened.append((remaining, valveOpenedAt))
            }
        }
        
        return best.pressureReleased
    }
}
