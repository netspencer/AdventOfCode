import Utils
import Foundation

extension FileSystem {
    static func parse(_ input: Input) -> FileSystem {
        let root: FileNode = .directory(name: "/")
        var pwd: FileNode? = root
        
        for line in input.lines {
            let components = line.components(separatedBy: " ")
            switch (components[0], components[1]) {
            case ("$", "cd"):
                switch components[2] {
                case "/": pwd = root
                case "..": pwd = pwd?.parent
                default: pwd = pwd?.child(name: components[2])
                }
                
            case ("$", "ls"):
                continue
                
            default:
                pwd?.add(child: .parse(components))
            }
        }

        return FileSystem(root: root)
    }
}

extension FileNode {
    static func parse(_ input: [String]) -> FileNode {
        let (size, name) = input.splat()
        guard size != "dir" else {
            return .directory(name: name)
        }
        return .file(size: Int(size)!, name: name)
    }
}

