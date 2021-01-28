
import Foundation

struct ErrorHandler {

    func handleError(_ error: HTTPError, function: String = #function) {
        Debug.print(error.message, function: function)
    }
}
