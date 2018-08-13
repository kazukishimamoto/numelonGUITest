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

        let nk : NumeronKeyboardViewController = NumeronKeyboardViewController(frame: CGRect(x: 0, y: self.view.frame.height / 3 * 2, width: self.view.frame.width, height: self.view.frame.height / 3))
        
        let view = nk.getView()
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

