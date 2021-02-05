
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
                
                Text("World of Warcraft Covenants in Shadowlands")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                ThickDivider()
                    .padding(.bottom, 40)
                
                if viewModel.isCovenantLoaded {
                    
                    ForEach(0..<viewModel.covenantNames.count, id: \.self) { (idx)  in
                        
                        NavigationLink("\(viewModel.covenantNames[idx])", destination: CovenantMainView(viewModel: CovenantMainViewModel.init(), covenantID: idx + 1))
                            .frame(width: 200, height: 60, alignment: .center)
                            .background(Color.background03)
                            .accentColor(.textColour)
                            .opacity(1.0)
                            .cornerRadius(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.background02, lineWidth: 4)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gold, lineWidth: 2)
                            )
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
