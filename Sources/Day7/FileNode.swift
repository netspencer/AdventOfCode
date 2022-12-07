class FileNode {
    private enum Value {
        case directory(name: String)
        case file(size: Int, name: String)
    }
    
    private var value: Value
    
    var children: [FileNode]
    weak var parent: FileNode?
    
    private init(_ value: Value) {
        self.value = value
        self.children = []
    }
    
    static func directory(name: String) -> FileNode {
        return FileNode(.directory(name: name))
    }
    
    static func file(size: Int, name: String) -> FileNode {
        return FileNode(.file(size: size, name: name))
    }
    
    func add(child: FileNode) {
        child.parent = self
        children.append(child)
    }

    func child(name: String) -> FileNode? {
        children.first { $0.name == name }
    }
    
    var name: String? {
        switch value {
        case let .directory(name: name):
            return name
        case let .file(_, name: name):
            return name
        }
    }
        
    var size: Int {
        switch value {
        case let .file(size, _):
            return size
        case .directory:
            return children.map(\.size).sum
        }
    }
    
    var isDirectory: Bool {
        switch value {
        case .directory: return true
        default: return false
        }
    }
    
    var directorySizes: [Int] {
        (isDirectory ? [size] : []) + children.flatMap(\.directorySizes)
    }
}
