extension Character {
    var priority: Int {
        guard let asciiValue else { return 0 }
        return Int(asciiValue) - (isUppercase ? 38 : 96)
    }
}
