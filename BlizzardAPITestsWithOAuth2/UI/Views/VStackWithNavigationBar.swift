
import SwiftUI

struct VStackWithNavigationBar<Content:View>: View {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    let navBarTitle: String
    let showBackButton: Bool
    let zStackAlignment: Alignment
    let vStackAlignment: HorizontalAlignment
    let vStackSpacing: CGFloat?
    
    // # Private/Fileprivate
    private var content: () -> Content
    
    // # Body
    var body: some View {
        
        ZStackWithBackground(alignment: zStackAlignment) {
            
            VStack(alignment: self.vStackAlignment, spacing: self.vStackSpacing) {
                
                NavigationBar(title: self.navBarTitle, showBackButton: self.showBackButton)
                    .frame(height: kUI.Size.navigationBarHeight)
                self.content()
            }
        }
        .navigationBarHidden(true)
    }
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    public init(zStackAlignment: Alignment = .center,
                vStackAlignment: HorizontalAlignment = .center,
                vStackSpacing: CGFloat? = nil,
                navBarTitle: String? = nil,
                showBackButton: Bool = false,
                @ViewBuilder content: @escaping () -> Content) {
        self.zStackAlignment = zStackAlignment
        self.vStackAlignment = vStackAlignment
        self.vStackSpacing = vStackSpacing
        self.navBarTitle = navBarTitle ?? ""
        self.showBackButton = showBackButton
        self.content = content
    }
    
    public init(zStackAlignment: Alignment = .center,
                vStackAlignment: HorizontalAlignment = .center,
                vStackSpacing: CGFloat? = nil,
                navBarTitle: String? = nil,
                @ViewBuilder content: @escaping () -> Content) {
        self.zStackAlignment = zStackAlignment
        self.vStackAlignment = vStackAlignment
        self.vStackSpacing = vStackSpacing
        self.navBarTitle = navBarTitle ?? ""
        self.showBackButton = false
        self.content = content
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
}
