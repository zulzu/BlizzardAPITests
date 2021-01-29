
import SwiftUI

struct CovenantMainView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @ObservedObject var viewModel: CovenantMainViewModel
    var covenantID: Int
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        ZStack {
            
            if viewModel.isCovenantLoaded {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(viewModel.covenantDescription)
                        .modifier(AnimatedOpacity(delay: 0.2))
                    
                    Text("Signature ability: \(viewModel.abilityName)")
                        .bold()
                        .modifier(AnimatedOpacity(delay: 0.6))
                    
                    Text(viewModel.abilityDescription)
                        .modifier(AnimatedOpacity(delay: 1.0))
                    
                    NavigationLink("Class abilities", destination: CovenantClassAbilitiesView(viewModel: CovenantClassAbilitiesViewModel.init(), covenantID: covenantID))
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                        .accentColor(.black)
                        .modifier(AnimatedOpacity(delay: 1.4))

                    Spacer()
                }
            }
        }
        .onAppear {
            viewModel.getCovenant(id: covenantID)
        }
        .navigationBarTitle(viewModel.covenantName, displayMode: .large)
        .padding()
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
struct CovenantMainView_Previews: PreviewProvider {
    static var previews: some View {
        CovenantMainView(viewModel: CovenantMainViewModel.init(), covenantID: 1)
    }
}
