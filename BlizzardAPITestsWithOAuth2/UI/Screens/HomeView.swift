
import SwiftUI

struct HomeView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @ObservedObject var viewModel: HomeViewModel
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        ZStackWithBackground {
            
            VStack {
                
                if viewModel.isLoggedIn {
                    
                    CovenantsView()
                    
                } else {
                    
                    VStack {
                        
                        Text("Welcome!")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.gold)
                            .padding()
                        Text("Getting data from Blizzard")
                            .font(.caption)
                            .foregroundColor(.background03)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.login()
        })
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


////=======================================
//// MARK: Previews
////=======================================
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CovenantsView()
    }
}
