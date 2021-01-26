
import Foundation


public class Debug {
    public class func print(_ string: String, separator: String = " ", terminator: String = "\n", file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let filename = file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? file
        Swift.print("$ \(filename).\(function) [\(line)]: \(string)", separator: separator, terminator: terminator)
        #endif
    }
}
