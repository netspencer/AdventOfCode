/// readInput gets the entirety of the stdin and returns it as a String
public func readInput() -> String {
    var input = ""
    while let line = readLine(strippingNewline: false) {
        input += line
    }
    return input
}
