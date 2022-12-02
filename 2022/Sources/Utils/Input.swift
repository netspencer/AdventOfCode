import Foundation

public struct Input: RawRepresentable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init() {
        var inputString = ""
        while let line = readLine(strippingNewline: false) {
            inputString += line
        }
        self.init(rawValue: inputString)
    }
    
    public var lines: [String] {
        rawValue.components(separatedBy: .newlines).dropLast()
    }
}
