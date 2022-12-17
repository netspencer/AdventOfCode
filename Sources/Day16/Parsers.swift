import Foundation
import Parsing
import SwiftGraph
import Utils

extension PipeNetwork {
    static func parse(_ input: Input) -> PipeNetwork {
        self.init(graph: .parse(input))
    }
}

extension UnweightedGraph<PipeNetwork.Valve>  {
    static func parse(_ input: Input) -> UnweightedGraph<PipeNetwork.Valve> {
        let valve = Parse {
            "Valve "
            Prefix(2).map(.string)
            " has flow rate="
            Int.parser()
            "; "
            Skip {
                Prefix(while: { $0.isLowercase || $0.isWhitespace })
            }
            Many {
                Prefix(2).map(.string)
            } separator: {
                ", "
            }
        }
        let valves = Parse {
            Many {
                valve
            } separator: {
                Whitespace(1, .vertical)
            } terminator: {
                Whitespace(1, .vertical)
            }
        }
        let data = (try! valves.parse(input.rawValue))
        var dict = [String: PipeNetwork.Valve]()
        for (name, pressure, _) in data {
            dict[name] = PipeNetwork.Valve(name: name, pressure: pressure)
        }
        let graph = UnweightedGraph<PipeNetwork.Valve>(vertices: Array(dict.values.map { $0 }))
        for (name, _, tunnels) in data {
            for tunnel in tunnels {
                if let from = dict[name], let to = dict[tunnel] {
                    graph.addEdge(from: from, to: to)
                }
            }
        }
        return graph
    }
}
