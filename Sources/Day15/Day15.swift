import Algorithms
import Foundation
import Utils

@main
struct Day15: Exercise {
    let beaconMap: BeaconMap

    init(input: Input) {
        self.beaconMap = BeaconMap.parse(input)
        dump(beaconMap)
    }
    
    var partOne: String {
        beaconMap
            .numLocationsWhereNoBeaconPossible(forY: 2_000_000)
            .description
    }

    var partTwo: String {
        beaconMap
            .findUndetectedBeacon(searchSpace: 0...4_000_000)!
            .tuningFrequency
            .description
    }
}