import Foundation

struct State: Hashable {
    var timestamp: Int
    var rocks: [Rock: Int]
    var robots: [Rock: Int]
    
    init(timestamp: Int, rocks: [Rock : Int], robots: [Rock : Int]) {
        self.timestamp = timestamp
        self.rocks = rocks
        self.robots = robots
    }
    
    static let initial = State(timestamp: 0, rocks: [:], robots: [.ore: 1])
    
    mutating func buildRobot(for rock: Rock, costing costs: [Blueprint.Cost]) {
        for cost in costs {
            rocks[cost.rock, default: 0] -= cost.quantity
        }
        robots[rock, default: 0] += 1
    }
    
    mutating func harvestRocksWithRobots() {
        for (rock, quantity) in robots {
            rocks[rock, default: 0] += quantity
        }
    }
    
    mutating func clamped(to requirements: [Rock: Int]) {
        for (rock, quantity) in rocks {
            rocks[rock, default: 0] = min(quantity, requirements[rock, default: 0] + 1)
        }
    }
    
    var geodeCount: Int {
        rocks[.geode, default: 0]
    }
    
    var geodeRobotCount: Int {
        robots[.geode, default: 0]
    }
}
