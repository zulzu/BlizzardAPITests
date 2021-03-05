
import Foundation

//=======================================
// MARK: ViewModel
//=======================================
final class HomeViewModel: ObservableObject {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @Published var isLoggedIn = false
    
    // # Private/Fileprivate
    private let authManager = AuthenticationManager()
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//------------------------------------
// MARK: Retrieving data
//------------------------------------
extension HomeViewModel {
    
    func login() {
        authManager.getClientAccessToken() { result in
            switch result {
            case .success(let token):
                Debug.print("clientAccessToken: \(token)")
                Debug.print("Ready for game data web services")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.isLoggedIn = true
                }
            case .failure(let error):
                ErrorHandler().handleError(error)
            }
        }
    }
}
