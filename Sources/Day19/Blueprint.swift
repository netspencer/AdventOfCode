import Algorithms
import Collections
import Foundation
import Utils

struct Blueprint {
    struct Cost {
        let rock: Rock
        let quantity: Int
    }
    
    let index: Int
    let robotCosts: [Rock: [Cost]]
    
    init(index: Int, robotCosts: [Rock : [Cost]]) {
        self.index = index
        self.robotCosts = robotCosts
    }
    
    var maxNeeded: [Rock: Int] {
        var needed = robotCosts.reduce(into: [Rock: Int]()) { maxNeeded, item in
            for cost in item.value {
                maxNeeded[cost.rock] = max(cost.quantity, maxNeeded[cost.rock, default: 0])
            }
        }
        needed[.geode] = 20000
        return needed
    }
    
    func maxGeodes(in minutes: Int) -> Int {
        var maxGeodes = 0
        
        var queue = Deque([State.initial])
        var visited = Set<State>()
        
        while let state = queue.popFirst() {
            guard visited.insert(state).inserted else { continue }
            
            let remainingTime = minutes - state.timestamp
            
            let maxPotential = state.geodeCount
                + state.oreRobotCount * remainingTime
                + ((remainingTime * remainingTime) / 2)

            guard maxPotential >= maxGeodes else { continue }
            
            maxGeodes = max(maxGeodes, state.geodeCount)
            
            guard state.timestamp < minutes else { continue }
            
            for rock in Rock.allCases {
                // check that we can afford to buy the robot
                guard let costs = robotCosts[rock], state.rocks.canAfford(costs) else { continue }
                // check that we even need to buy the robot
                guard state.robots[rock, default: 0] < maxNeeded[rock, default: 0] else { continue }
                
                var newState = state
                newState.timestamp += 1
                newState.harvestRocksWithRobots()
                newState.buildRobot(for: rock, costing: costs)
                
                queue.append(newState)
            }
            
            var newState = state
            newState.timestamp += 1
            newState.harvestRocksWithRobots()
            newState.clamped(to: maxNeeded)
            
            queue.append(newState)
        }
        
        return maxGeodes
    }
}

extension Dictionary<Rock, Int> {
    func canAfford(_ costs: [Blueprint.Cost]) -> Bool {
        costs.allSatisfy { cost in
            cost.quantity <= self[cost.rock, default: 0]
        }
    }
}
