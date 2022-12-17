import Algorithms
import Foundation
import SwiftGraph
import Utils

extension UnweightedGraph {
    // https://cp-algorithms.com/graph/all-pair-shortest-path-floyd-warshall.html
    func computeShortestPaths() -> [[Int]] {
        var shortestPaths = [[Int]].init(repeating: .init(repeating: .max, count: count), count: count)
        for index in indices {
            shortestPaths[index][index] = 0
        }
        
        let flattenedEdges = edges.flatMap { $0 }
        for edge in flattenedEdges {
            shortestPaths[edge.u][edge.v] = 1
        }
        
        for middle in indices {
            for from in indices {
                for to in indices {
                    guard shortestPaths[from][middle] != .max && shortestPaths[middle][to] != .max else {
                        continue
                    }
                    shortestPaths[from][to] = Swift.min(
                        shortestPaths[from][to],
                        shortestPaths[from][middle] + shortestPaths[middle][to]
                    )
                }
            }
        }
        
        return shortestPaths
    }
}

extension UnweightedGraph<PipeNetwork.Valve> {
    func index(for name: String) -> Int? {
        vertices.enumerated().first(where: { $0.element.name == name })?.offset
    }
}
