
import SwiftUI

struct AnimatedFadeIn: ViewModifier {
    
    // For changing the opacity
    @State private var opacity: Double = 0.0
    // The type of the animation
    var animation: Animation = .easeOut(duration: 0.7)
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

struct Blink: ViewModifier {
    
    // For changing the opacity
    @State private var opacity: Double = 0.3
    // The type of the animation
    var animation: Animation = .easeOut(duration: 0.5)
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear {
                opacity = 1.0
            }
            .animation(animation.repeatForever())
    }
}
