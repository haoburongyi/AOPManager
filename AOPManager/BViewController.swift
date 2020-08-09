//
//  BViewController.swift
//  AOPManager
//
//  Created by 张淏 on 2020/8/8.
//  Copyright © 2020 张淏. All rights reserved.
//

import UIKit

class BViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(CViewController.init(), animated: true)
    }
}
