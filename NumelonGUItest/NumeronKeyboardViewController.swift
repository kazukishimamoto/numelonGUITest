//
//  NumeronKeyboardViewController.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/13.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class NumeronKeyboardViewController: UIViewController, AbstructKeyboard {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var keyboardView: UIView = UIView()
    
    func getView() -> UIView{
        /* 以下の行を追加する */
        let view1 = UIView(frame: CGRect(x: 0, y: self.view.frame.height / 3 * 2, width: self.view.frame.width, height: self.view.frame.height / 3))
        view1.backgroundColor = .lightGray
        
        return view1
    }
    
    public weak var kernel: NumeronKernel? = nil
    
    public func tapped(point: CGPoint) {
    }
    
    private func cnvAnsType(_ num: Int) -> [String] {
        var n = num
        var result = [String]()
        while n > 0 {
            let s = String(n%10)
            result.insert(s, at: 0)
            n /= 10
        }
        return result
    }

}
