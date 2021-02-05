
#if os(iOS)
import UIKit
import SwiftUI

public extension UIDevice {
    
    static var hasNotch: Bool {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
    }
}

public struct UniversalScreen {
    public static let height: CGFloat = UIScreen.height
    public static let width: CGFloat = UIScreen.height
}

public extension UIScreen {
    
    static var height: CGFloat {
        UIScreen.main.bounds.size.height
    }

    static var width: CGFloat {
        UIScreen.main.bounds.size.width
    }
}

public extension UIWindow {
    
    /// Returns the key window for this application. Uses different APIs to get the key window depending on if the app is running on iOS 13 or 14+
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

public extension Color {
    
    static let background01: Color = Color("background01")
    static let background02: Color = Color("background02")
    static let background03: Color = Color("background03")
    static let gold: Color = Color("gold")
    static let textColour: Color = Color("textColour")    
}
#endif
