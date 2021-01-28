
import SwiftUI

struct ContentView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let authManager = AuthenticationManager()
    
    // # Private/Fileprivate
    @State private var isLoggedIn = false
    
    // # Body
    var body: some View {
        
        VStack {
            
            if isLoggedIn {
                
                HomeView()
                
            } else {
                
                VStack {
                    
                    Text("Welcome!")
                        .font(.title)
                        .fontWeight(.black)
                        .padding()
                    Text("Getting data from Blizzard")
                        .font(.caption)
                }
            }
        }
        .onAppear(perform: {
            authManager.getClientAccessToken() { result in
                switch result {
                case .success(let token):
                    Debug.print("clientAccessToken: \(token)")
                    Debug.print("Ready for game data web services")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isLoggedIn = true
                    }
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
