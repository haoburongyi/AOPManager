//
//  UIView+Extension.swift
//  XHCRM_iOS
//
//  Created by 张淏 on 2020/8/6.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

extension UIView {
    
    var x: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    
    var y: CGFloat {
        set {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }
    
    var width: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    
    var height: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    
    var maxX: CGFloat {
        set {
            frame.origin.x = newValue - frame.size.width
        }
        get {
            return frame.origin.x + frame.size.width
        }
    }
    
    var maxY: CGFloat {
        set {
            frame.origin.y = newValue - frame.size.height
        }
        get {
            return frame.origin.y + frame.size.height
        }
    }
    
    var centerX: CGFloat {
        set {
            center.x = newValue
        }
        get {
            return center.x
        }
    }
    
    var centerY: CGFloat {
        set {
            center.y = newValue
        }
        get {
            return center.y
        }
    }
    
    var origin: CGPoint {
        set {
            frame.origin = newValue
        }
        get {
            return frame.origin
        }
    }
    
    var size: CGSize {
        set {
            frame.size = newValue
        }
        get {
            return frame.size
        }
    }
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
}
