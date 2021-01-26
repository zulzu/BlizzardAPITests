
import Foundation
import UIKit


/// UI element size constants
enum kUI {
    
    enum ButtonDiameter {
        /// 68pt
        static let large:CGFloat = 68
        /// 62pt
        static let regular:CGFloat = 62
        /// 42pt
        static let small:CGFloat = 42
        /// 30pt
        static let extraSmall:CGFloat = 30
        /// 68pt
        static let largeSquare:CGSize = CGSize(width: kUI.ButtonDiameter.large, height: kUI.ButtonDiameter.large)
         /// 62pt
        static let regularSquare:CGSize = CGSize(width: kUI.ButtonDiameter.regular, height: kUI.ButtonDiameter.regular)
         /// 42pt
        static let smallSquare:CGSize = CGSize(width: kUI.ButtonDiameter.small, height: kUI.ButtonDiameter.small)
        /// 30pt
        static let extraSmallSquare:CGSize = CGSize(width: kUI.ButtonDiameter.extraSmall, height: kUI.ButtonDiameter.extraSmall)
    }
    
    enum IconLength {
        /// 30pt
        static let large:CGFloat = 30
        //// 18pt
        static let regular:CGFloat = 18
        /// 12pt
        static let small:CGFloat = 12
        /// 8pt
        static let extraSmall:CGFloat = 8
        /// 30pt
        static let largeSquare:CGSize = CGSize(width: kUI.IconLength.large, height: kUI.IconLength.large)
        /// 18pt
        static let regularSquare:CGSize = CGSize(width: kUI.IconLength.regular, height: kUI.IconLength.regular)
        /// 12pt
        static let smallSquare:CGSize = CGSize(width: kUI.IconLength.small, height: kUI.IconLength.small)
        /// 8pt
        static let extraSmallSquare:CGSize = CGSize(width: kUI.IconLength.extraSmall, height: kUI.IconLength.extraSmall)
    }
    
    enum Border {
        static let cornerRadius: CGFloat = 10
    }

    enum Padding {
        static let screenTop: CGFloat = (UIDevice.hasNotch ? 40 : 20)
        static let screenBottom: CGFloat = (UIDevice.hasNotch ? 50 : 30)
        static let screenLeading: CGFloat = 25
        static let screenTrailing: CGFloat = 25
        static let screenHorizontal: CGFloat = 25
    }
    
    enum Spacing {
        static let titleToSubtitleLarge: CGFloat = 50
        static let titleToSubtitleSmall: CGFloat = 25
        static let titleToSubtitleTiny: CGFloat = 10
        static let buttonToButton: CGFloat = 10
        static let cellToCell: CGFloat = 8
    }
    
    enum Size {
        static let segmentedControlHeight: CGFloat = 52
        static let wideElementWidth: CGFloat = UIScreen.width - Padding.screenLeading - Padding.screenTrailing
        static let halfWideElementWidth: CGFloat = wideElementWidth * 0.5 - kUI.Spacing.buttonToButton
        static let bottomBarLargeHeight: CGFloat = UIDevice.hasNotch ? 110 : 94
        static let rectangleButtonHeight: CGFloat = 52
        static let navigationBarHeight: CGFloat = UIDevice.hasNotch ? 88 : 64
        static let bottomBarHeight: CGFloat = UIDevice.hasNotch ? 104 : 44
        static let notchHeight: CGFloat = UIWindow.key?.safeAreaInsets.top ?? 0
        static let cellHeightLarge: CGFloat = 118
    }
}

/// Names of images included in the Assets
enum kImageName {
    static let test: String = "Test"
}
