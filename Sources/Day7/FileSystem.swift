class FileSystem {
    let root: FileNode
    
    init(root: FileNode) {
        self.root = root
    }
        
    var directorySizes: [Int] {
        root.directorySizes
    }
    
    var hardDriveSize: Int {
        70_000_000
    }
    
    var requiredFreeSize: Int {
        30_000_000
    }
    
    var maxAllowedSize: Int {
        hardDriveSize - requiredFreeSize
    }
    
    var overflowSize: Int {
        root.size - maxAllowedSize
    }
}
