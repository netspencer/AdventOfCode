import Utils
import Foundation

extension FileSystem {
    static func parse(_ input: Input) -> FileSystem {
        let root = FileNode(.directory(name: "/"))
        var pwd: FileNode? = root
        
        for line in input.lines {
            let components = line.components(separatedBy: " ")
            switch (components[0], components[1]) {
            case ("$", "cd"):
                switch components[2] {
                case "/": pwd = root
                case "..": pwd = pwd?.parent
                default: pwd = pwd?.childDirectory(name: components[2])
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
        precondition(input.count == 2)
        if input[0] == "dir" {
            return FileNode(.directory(name: String(input[1])))
        } else {
            return FileNode(.file(size: Int(input[0])!, name: String(input[1])))
        }
    }
}

