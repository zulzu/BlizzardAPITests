
import SwiftUI

struct CovenantMainView: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    @ObservedObject var viewModel: CovenantMainViewModel
    var covenantID: Int
    var animation: Animation = .easeIn(duration: 1.0)

    // # Private/Fileprivate
    @State private var opacity: Double = 0.0

    // # Body
    var body: some View {
        
        ZStack {
            
            if viewModel.isCovenantLoaded {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(viewModel.covenantDescription)
                        .opacity(opacity)
                        .onAppear {
                            opacity = 1.0
                        }
                        .animation(animation)

                    Text("Signature ability: \(viewModel.abilityName)")
                        .bold()
                        .opacity(opacity)
                        .onAppear {
                            opacity = 1.0
                        }
                        .animation(animation.delay(0.5))

                    Text(viewModel.abilityDescription)
                        .opacity(opacity)
                        .onAppear {
                            opacity = 1.0
                        }
                        .animation(animation.delay(1.0))

                    Spacer()
                }
            }
        }
        .onAppear {
            viewModel.getCovenant(id: covenantID)
        }
        .navigationBarTitle(viewModel.covenantName, displayMode: .inline)
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
