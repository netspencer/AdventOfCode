import Algorithms
import Foundation
import Collections
import Utils

struct Cave {
    let rocks: [Rock]
    var gasQueue: Deque<Direction>
    var grid: [Set<Int>] = []
    
    var rockCount = 0
    var gasCount = 0
    
    init(rocks: [Rock], gas: [Direction]) {
        self.rocks = rocks
        self.gasQueue = Deque(gas)
    }
    
    var height: Int {
        grid.count
    }
    
    mutating func dropRocks(count: Int) {
        var counter = 0
        for rock in rocks.cycled() {
            drop(rock: rock)
            counter += 1
            if counter == count {
                break
            }
        }
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
