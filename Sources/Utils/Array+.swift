import Foundation

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
