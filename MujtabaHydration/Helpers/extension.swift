//
//  extension.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

//extension UITabBarController {
//    open override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        tabBar.layer.masksToBounds = true
//        tabBar.layer.cornerRadius = 16
//        // Choose with corners should be rounded
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // top left, top right
//
//        // Uses `accessibilityIdentifier` in order to retrieve shadow view if already added
//        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == "TabBarShadow" }) {
//            shadowView.frame = tabBar.frame
//        } else {
//            let shadowView = UIView(frame: .zero)
//            shadowView.frame = tabBar.frame
//            shadowView.accessibilityIdentifier = "TabBarShadow"
//            if UITraitCollection.current.userInterfaceStyle == .dark {
//                shadowView.backgroundColor = UIColor.white
//            }
//            else {
//                shadowView.backgroundColor = UIColor.black
//            }
//            shadowView.layer.cornerRadius = tabBar.layer.cornerRadius
//            shadowView.layer.maskedCorners = tabBar.layer.maskedCorners
//            shadowView.layer.masksToBounds = false
//            shadowView.layer.shadowColor = Color.black.cgColor
//            shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -8.0)
//            shadowView.layer.shadowOpacity = 0.3
//            shadowView.layer.shadowRadius = 10
//            view.addSubview(shadowView)
//            view.bringSubviewToFront(tabBar)
//            
//           
//        }
//    }
//}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
