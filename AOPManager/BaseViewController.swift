//
//  BaseViewController.swift
//  AOPManager
//
//  Created by 张淏 on 2020/8/8.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    public lazy var label: UILabel = {
        let label = UILabel.init()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let selfType = type(of: self)
        label.text = NSStringFromClass(selfType)
        label.sizeToFit()
        view.addSubview(label)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton.init()
        button.setTitle("back", for: .normal)
        button.sizeToFit()
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        view.addSubview(button)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let selfType = type(of: self)
        title = NSStringFromClass(selfType)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.center = view.center
        backButton.frame.origin = .init(x: view.bounds.width * 0.5 - backButton.bounds.width * 0.5, y: label.frame.maxY + 20)
    }
    
    @objc
    private func backPressed() {
        navigationController?.popViewController(animated: true)
    }

}
