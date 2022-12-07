class FileNode {
    enum Value {
        case directory(name: String)
        case file(size: Int, name: String)
    }
    
    var value: Value
    var children: [FileNode]
    weak var parent: FileNode?
    
    init(_ value: Value) {
        self.value = value
        self.children = []
    }
    
    func add(child: FileNode) {
        child.parent = self
        children.append(child)
    }

    func childDirectory(name: String) -> FileNode? {
        children.first { $0.directoryName == name }
    }
    
    var directoryName: String? {
        switch value {
        case let .directory(name: name):
            return name
        default:
            return nil
        }
    }
    
    var isDirectory: Bool {
        directoryName != nil
    }
    
    var size: Int {
        switch value {
        case let .file(size, _):
            return size
        case .directory:
            return children.map(\.size).sum
        }
    }
    
    var sizes: [Int] {
        [size] + children.filter(\.isDirectory).flatMap(\.sizes)
    }
}
