import Algorithms
import Foundation
import Collections
import Utils

struct Cave {
    struct Info: Hashable {
        let rockCount: Int
        let height: Int
        let caps: [Int]
    }
    
    var rockQueue: Deque<Rock>
    var gasQueue: Deque<Direction>
    
    var grid: [Set<Int>] = []
    
    var visited = [Int: [Int: [Info]]]()
    var rockCount = 0
    var gasCount = 0
    
    init(rocks: [Rock], gas: [Direction]) {
        self.rockQueue = Deque(rocks)
        self.gasQueue = Deque(gas)
    }
        
    mutating func dropRocks(count: Int) -> Int {
        while let rock = rockQueue.popFirst() {
            drop(rock: rock)
            
            let rockIndex = (rockCount).quotientAndRemainder(dividingBy: rockQueue.count).remainder
            let (gasLoop, gasIndex) = gasCount.quotientAndRemainder(dividingBy: gasQueue.count)
            
            rockQueue.append(rock)
            rockCount += 1
            
            guard gasLoop > 0 else { continue }
            
            let gridCaps = (0...6).map { index in
                grid.firstIndex(where: { $0.contains(index) }) ?? 0
            }
            
            guard let match = visited[gasIndex]?[rockIndex]?.first(where: { $0.caps == gridCaps }) else {
                visited[gasIndex, default: [:]][rockIndex, default: []]
                    .append(Info(
                        rockCount: rockCount,
                        height: grid.count,
                        caps: gridCaps
                    ))
                continue
            }
            
            let cycleSize = rockCount - match.rockCount
            let (numberOfCycles, numberOfExtras) = (count - match.rockCount)
                .quotientAndRemainder(dividingBy: cycleSize)
            
            let cycleHeight = grid.count - match.height
            let totalCycleHeight = numberOfCycles * cycleHeight
            
            let total = match.height + totalCycleHeight
            
            let extrasTotal: Int = {
                guard numberOfExtras > 1 else { return 0 }
                
                let initialGridHeight = grid.count
                for _  in 1 ... numberOfExtras {
                    guard let rock = rockQueue.popFirst() else { continue }
                    rockQueue.append(rock)
                    drop(rock: rock)
                }
                return grid.count - initialGridHeight
            }()
            
            return total + extrasTotal
        }
        
        fatalError()
    }

    mutating func drop(rock: Rock) {
        var rock = rock
            .moving(.right, count: 2)
            .moving(.up, count: grid.count + 3)

        while let gas = gasQueue.popFirst() {
            gasCount += 1
            gasQueue.append(gas)
            
            rock = rock.moving(gas, in: grid)
            guard !rock.isDoneFalling(in: grid) else { break }
            rock = rock.moving(.down)
        }
        
        grid.insert(rock)
    }
}

extension Array<Set<Int>> {
    mutating func insert(_ rock: Rock) {
        for point in rock.points {
            while !indices.contains(point.y) {
                append([])
            }
            
            self[point.y].insert(point.x)
        }
    }
}

extension Cave: CustomStringConvertible {
    var description: String {
        grid.reversed().map { row in
            (0...6).map { x in
                row.contains(x) ? "#" : "."
            }
            .joined()
        }
        .joined(separator: "\n")
    }
}
