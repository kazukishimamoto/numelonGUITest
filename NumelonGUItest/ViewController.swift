//
//  ViewController.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/13.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nk : NumeronKeyboardViewController = NumeronKeyboardViewController()
        
        let view = nk.getView()
        self.view.addSubview(view)
        
        let button = testButton(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 400))
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

