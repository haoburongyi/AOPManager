//
//  AOPManager.swift
//  XHCRM_iOS
//
//  Created by 张淏 on 2020/8/7.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

class AOPManager: NSObject {
    
    static let instance = AOPManager.init()
    private override init() { super.init() }
    fileprivate lazy var navigationControlDict: [String : Bool] = {
        let path = Bundle.main.path(forResource: "AOPNavigationHiddenControl", ofType: "plist")
        let nsdict = NSDictionary.init(contentsOfFile: path ?? "")
        var dict = [String : Bool]()
        let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
        nsdict?.forEach({ (key, value) in
            dict[nameSpace + "." + (key as? String ?? "")] = value as? Bool ?? false
        })
        return dict
    }()
    
    fileprivate lazy var registerThreadKitDict: [String : [String]] = {
        let path = Bundle.main.path(forResource: "AOPRegisterThreadKit", ofType: "plist")
        let nsdict = NSDictionary.init(contentsOfFile: path ?? "")
        var dict = [String : [String]]()
        let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
        nsdict?.forEach({ (key, value) in
            dict[nameSpace + "." + (key as? String ?? "")] = value as? [String] ?? []
        })
        return dict
    }()
    
    private static let onceLaunchNavigationManager: Void = {
        UIViewController.zh_swizzle(originalSelector: #selector(UIViewController.viewWillAppear(_:)), swizzledSelector: #selector(UIViewController.aopViewWillAppear(_:)))
    }()
    
    private static let onceRegisterThreadKit: Void = {
        UIViewController.zh_swizzle(originalSelector: #selector(UIViewController.viewDidLoad), swizzledSelector: #selector(UIViewController.aopViewDidLoad))
    }()
}

// MARK: - Public
extension AOPManager {
    
    public func launchNavigationManager() {
        AOPManager.onceLaunchNavigationManager
    }
    
    public func registerThreadKit() {
        AOPManager.onceRegisterThreadKit
    }
}

// MARK: - Private
extension UIViewController {
    
    private var aopNavigationControlDict: [String : Bool] {
        return AOPManager.instance.navigationControlDict
    }
    
    private var aopKey: String {
        return NSStringFromClass(self.classForCoder)
    }
    
    @objc
    fileprivate func aopViewWillAppear(_ animated: Bool) {
        aopViewWillAppear(animated)
        
        if let isHidden = aopNavigationControlDict[aopKey] {
            navigationController?.setNavigationBarHidden(isHidden, animated: true)
        }
    }
    
    private var aopRegisterThreadKitDict: [String : [String]] {
        get {
            return AOPManager.instance.registerThreadKitDict
        }
        set {
            AOPManager.instance.registerThreadKitDict = newValue
        }
    }
    
    @objc
    fileprivate func aopViewDidLoad() {
        
        let key = aopKey
        if let array = aopRegisterThreadKitDict[key] {
            array.forEach {
                AOPManager.instance.perform(Selector.init($0))
            }
            aopRegisterThreadKitDict[key] = nil
        }
        
        aopViewDidLoad()
    }
}

// MARK: - Register
extension AOPManager {
    
    @objc
    fileprivate func registerViewController() {
        print("line: \(#line), function: \(#function)" )
    }
    
    @objc
    fileprivate func registerViewController1() {
        print("line: \(#line), function: \(#function)" )
    }
    
    @objc
    fileprivate func registerA() {
        print("line: \(#line), function: \(#function)" )
    }
    
    @objc
    fileprivate func registerB() {
        print("line: \(#line), function: \(#function)" )
    }
    
    @objc
    fileprivate func registerC() {
        print("line: \(#line), function: \(#function)" )
    }
    
    @objc
    fileprivate func registerD() {
        print("line: \(#line), function: \(#function)" )
    }
    
    @objc
    fileprivate func registerE() {
        print("line: \(#line), function: \(#function)" )
    }
  
}
