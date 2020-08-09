//
//  CGFloat+ZHExtension.swift
//  XHCRM_iOS
//
//  Created by 张淏 on 2020/8/7.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

extension CGFloat {
    
    var int: Int { return Int(self) }
    var half: CGFloat { return self * 0.5 }
    var scale: CGFloat { return self * UIScreen.main.bounds.width / 375 }
    static var screenW: CGFloat { return UIScreen.main.bounds.width }
    static var screenH: CGFloat { return UIScreen.main.bounds.height }
}

extension Int {
    
    var float: CGFloat { return CGFloat(self) }
    var half: Int { return Int(Double(self) * 0.5) }
    var scale: Int { return Int(CGFloat(self) * UIScreen.main.bounds.width / 375) }
    static var screenW: Int { return Int(UIScreen.main.bounds.width) }
    static var screenH: Int { return Int(UIScreen.main.bounds.height) }
}
