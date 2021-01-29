
import SwiftUI

struct AnimatedOpacity: ViewModifier {
    
    // For changing the opacity
    @State private var opacity: Double = 0.0
    // The type of the animation
    var animation: Animation = .easeIn(duration: 1.0)
    // The length of the delay for the animation
    var delay: Double = 0.0
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear {
                opacity = 1.0
            }
            .animation(animation.delay(delay))
    }
}
