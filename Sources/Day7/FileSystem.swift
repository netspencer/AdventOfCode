class FileSystem {
    let root: FileNode
    
    init(root: FileNode) {
        self.root = root
    }
    
    var size: Int {
        root.size
    }
    
    var sizes: [Int] {
        root.sizes
    }
    
    var hardDriveSize: Int {
        70_000_000
    }
    
    var requiredFreeSpace: Int {
        30_000_000
    }
    
    var maxAllowedSize: Int {
        hardDriveSize - requiredFreeSpace
    }
    
    var overflowSize: Int {
        size - maxAllowedSize
    }
}
