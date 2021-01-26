
import Foundation


struct AuthToken {
    
    static let clientID = DoNotShare.myClientID
    static let clientSecret = DoNotShare.myClientSecret
    
    // For use with unit testing only
    static let clientAccessToken: String? = nil // "CLIENT_ACCESS_TOKEN"
    static let userAccessToken: String? = nil // "USER_ACCESS_TOKEN"
}
