
import SwiftUI

struct ContentView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let authManager = AuthenticationManager()
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        HomeView()
            .onAppear(perform: {
                authManager.getClientAccessToken() { result in
                    switch result {
                    case .success(let token):
                        Debug.print("clientAccessToken: \(token)")
                        Debug.print("Ready for game data web services")
                    case .failure(let error):
                        self.handleError(error)
                    }
                }
            })
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    func handleError(_ error: HTTPError, function: String = #function) {
        Debug.print(error.message, function: function)
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


//=======================================
// MARK: Previews
//=======================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
