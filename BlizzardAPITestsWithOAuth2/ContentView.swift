
import SwiftUI

struct ContentView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open

    // # Private/Fileprivate
    private let authManager = AuthenticationManager()
    @State private var isLoggedIn = false
    
    // # Body
    var body: some View {
        
        VStack {
            
            if isLoggedIn {
                
                HomeView(viewModel: HomeViewModel.init())
                
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
                    ErrorHandler().handleError(error)
                }
            }
        })
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
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
