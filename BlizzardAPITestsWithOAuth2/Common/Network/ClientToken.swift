
import Foundation


class ClientToken: Codable {
    
    let clientID: String
    let expiresIn: Int
    let authorities: [Authority]
    
    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case expiresIn = "exp"
        case authorities
    }
}

extension ClientToken: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        ClientToken {
            clientID: \(clientID),
            expiresIn: \(expiresIn),
            authorities: \(authorities)
        }
        """
    }
}

class Authority: Codable {
    let role: String
    
    enum CodingKeys: String, CodingKey {
        case role = "authority"
    }
}

extension Authority: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        {authority: \(role)}
        """
    }
}
