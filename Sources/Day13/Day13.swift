import Algorithms
import Foundation
import Utils

@main
struct Day13: Exercise {
    let packets: [Packet]
    
    init(input: Input) {
        self.packets = input.lines
            .filter { !$0.isEmpty }
            .compactMap(Packet.parse)
    }
    
    var partOne: String {
        packets
            .chunks(ofCount: 2)
            .enumerated()
            .filter { $0.element.first! < $0.element.last! }
            .map { $0.offset + 1 }
            .sum
            .description
    }
    
    var partTwo: String {
        let dividerPackets = [
            Packet.parse("[[2]]")!,
            Packet.parse("[[6]]")!,
        ]
        let sortedPackets = (packets + dividerPackets).sorted(by: <)
        
        let d1Index = sortedPackets.firstIndex(of: dividerPackets[0])!
        let d2Index = sortedPackets.firstIndex(of: dividerPackets[1])!
        
        return ((d1Index + 1) * (d2Index + 1)).description
    }
}
