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
    
    public init(fromFile file: URL) throws {
        self.init(rawValue: try String(contentsOf: file, encoding: .utf8))
    }
    
    public var lines: [String] {
        rawValue.components(separatedBy: .newlines).dropLast()
    }
}
