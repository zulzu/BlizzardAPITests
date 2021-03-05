
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
                
                ThickDivider()
                
                if viewModel.errorMessage != "" {
                    
                    ErrorMessageView(errorMessage: "\(viewModel.errorMessage)")
                    
                } else {
                    
                    Text("World of Warcraft Covenants in Shadowlands")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.gold)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                ThickDivider()
                    .padding(.bottom, 40)
                
                if viewModel.isCovenantLoaded {
                    
                    ForEach(0..<viewModel.covenantNames.count, id: \.self) { (idx)  in
                        
                        CustomNavigationButton(size: CGSize(width: 200, height: 60),
                                               text: "\(viewModel.covenantNames[idx])",
                                               destination: CovenantMainView(viewModel: CovenantMainViewModel.init(), covenantID: idx + 1))
                            .padding()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
