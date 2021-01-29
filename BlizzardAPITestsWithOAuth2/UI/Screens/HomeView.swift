
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
        
        VStack {
            
            if viewModel.isLoggedIn {
                
                CovenantsView(viewModel: CovenantsViewModel.init())
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
        CovenantsView(viewModel: CovenantsViewModel.init())
    }
}
