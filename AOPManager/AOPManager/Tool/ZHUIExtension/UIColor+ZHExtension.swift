//
//  UIColor+ZHExtension.swift
//  XHCRM_iOS
//
//  Created by 张淏 on 2020/8/6.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init (_ gray: Int) {
        self.init(red: CGFloat(gray) / 255.0, green: CGFloat(gray) / 255.0, blue: CGFloat(gray) / 255.0, alpha: 1)
    }
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat = 1) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(_ hex: String) {
        let string = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        
        Scanner(string: string).scanHexInt32(&int)
        
        let a, r, g, b: UInt32
        switch string.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(Int(r), Int(g), Int(b), CGFloat(a) / 255)
    }
    
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
    }
}
