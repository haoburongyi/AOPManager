//
//  ViewController.swift
//  AOPManager
//
//  Created by 张淏 on 2020/8/8.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel.init()
        label.text = "To AViewController"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(AViewController.init(), animated: true)
    }
}

