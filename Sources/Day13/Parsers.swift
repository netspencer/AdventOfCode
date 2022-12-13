import Utils

extension Packet {
    static func parse(_ input: String) -> Packet? {
        var s = Scanner(data: input)
        return Packet.parse(&s)
    }
    
    static func parse(_ input: inout Scanner<String>) -> Packet? {
        if input.tryScan("[") {
            var list = [Packet]()
            while let packet = parse(&input) {
                list.append(packet)
                input.tryScan(",")
            }
            input.scan("]")
            return .list(list)
        } else if let int = input.tryScanInt() {
            return .integer(int)
        } else {
            return nil
        }
    }
}

