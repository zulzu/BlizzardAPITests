
import Foundation

/// A key for retrieving a String that can be displayed to the user
enum StringKey: String, CaseIterable {
    
    /// The word "Back"
    case back
    /// The word "Home"
    case home
    /// A generic error message
    case errorMsg
}

extension String {
    
    /// Retrieves any non-database stored strings for the app.
    /// - Parameter stringKey: An instance of StringKey
    /// - Returns: A String
    static func getString(_ stringKey:StringKey) -> String {
        guard let string = StringProvider.strings[stringKey] else {
            assertionFailure("A String could not be retreived for StringKey: '\(stringKey.rawValue)'")
            return "MISSING TEXT"
        }
        return string
    }
}

fileprivate struct StringProvider {
    
    /// A dictionary containing all the static strings for the app
    static var strings: [StringKey:String] {
        [
            .back: "Back",
            .home: "Home",
            .errorMsg: "Error, could't retrieve data",
        ]
    }
}
