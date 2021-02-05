
import SwiftUI

struct CustomNavigationButton<Destination> : View where Destination : View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let size: CGSize
    let text: String
    let destination: Destination
    
    // # Private/Fileprivate
    
    // # Body
    var body: some View {
        
        return NavigationLink(destination: destination) {
            
            ZStack {
                
                Rectangle()
                    .frame(width: size.width, height: size.height)
                    .foregroundColor(.background03)
                    .cornerRadius(kUI.Border.cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: kUI.Border.cornerRadius)
                            .stroke(Color.background02, lineWidth: 4)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: kUI.Border.cornerRadius)
                            .stroke(Color.gold, lineWidth: 2)
                    )
                
                Text(text)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.textColour)
            }
        }
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    /// Creates an instance that presents `destination`.
    public init(size: CGSize, text: String, destination: Destination) {
        self.size = size
        self.text = text
        self.destination = destination
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    
}

////=======================================
//// MARK: Previews
////=======================================
struct CustomNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationButton(size: CGSize(width: 200, height: 60), text: "Button", destination: HomeView(viewModel: HomeViewModel.init()))
    }
}
