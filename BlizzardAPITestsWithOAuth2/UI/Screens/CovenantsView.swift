
import SwiftUI

struct CovenantsView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @ObservedObject var viewModel: CovenantsViewModel
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        NavigationView {
            
            VStackWithNavigationBar(zStackAlignment: .top, showBackButton: false) {
                ScrollView {
                    
                    Text("World of Warcraft Covenants in Shadowlands:")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.gold)
                        .padding()
                    
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
        }
        .onAppear {
            viewModel.getCovenantIndex()
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    init() {
        viewModel = CovenantsViewModel.init()
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}


////=======================================
//// MARK: Previews
////=======================================
struct CovenantsView_Previews: PreviewProvider {
    static var previews: some View {
        CovenantsView()
    }
}
