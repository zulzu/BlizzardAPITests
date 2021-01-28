
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
        
        NavigationView {
            
            VStack {
                
                Text("Hello, World of Warcraft!")
                    .font(.headline)
                    .fontWeight(.bold)
                
                if viewModel.isCovenantLoaded {
                    
                    ForEach(0..<viewModel.covenantNames.count, id: \.self) { (idx)  in
                        
                        NavigationLink("\(viewModel.covenantNames[idx])", destination: CovenantMainView(viewModel: CovenantMainViewModel.init(), covenantID: idx + 1))
                            .frame(width: 220, height: 80, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(10.0)
                            .accentColor(.black)
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getCovenantIndex()
        }
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
        HomeView(viewModel: HomeViewModel.init())
    }
}
