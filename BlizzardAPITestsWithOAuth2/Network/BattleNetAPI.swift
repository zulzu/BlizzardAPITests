
import Foundation


/// This class is an interface to all the web services, with separate properties for accessing authentication, user, and specific game web services.
class BattleNetAPI {
    
    /// Authenication web services
    public static let authentication = WS_Authentication()
    /// User web services
    public static let user = WS_User()
    /// World of Warcraft web services
    public static let wow = WS_WorldOfWarcraft()
}
