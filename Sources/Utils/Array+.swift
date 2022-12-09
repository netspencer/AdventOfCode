import Foundation

// MARK: - Head + Tail

public extension Array {
    var head: Element {
        get {
            self[0]
        }
        set {
            self[0] = newValue
        }
    }
    
    var tail: Element {
        get {
            self[count-1]
        }
        set {
            self[count-1] = newValue
        }
    }
}

// MARK: Splat

public extension Array {
    func splat() -> (Element,Element) {
        return (self[0],self[1])
    }
    
    func splat() -> (Element,Element,Element) {
        return (self[0],self[1],self[2])
    }
    
    func splat() -> (Element,Element,Element,Element) {
        return (self[0],self[1],self[2],self[3])
    }
    
    func splat() -> (Element,Element,Element,Element,Element) {
        return (self[0],self[1],self[2],self[3],self[4])
    }
}
