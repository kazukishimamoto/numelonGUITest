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
        
//        let kb = KeyboardGUI()
//        var keyboard = kb.getView()
//
//        self.view.addSubview(keyboard)
        
//        let nk : NumeronKeyboardViewController = NumeronKeyboardViewController()
//
//        let view = nk.getView()
//        self.view.addSubview(view)
//
//        let button = testButton(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 400))
//        self.view.addSubview(button)
        let uiDesign = UIDesign(displayBounds: self.view.bounds)
        let level = Level(digit: 3, digitRange: [Int](0...5), type: .DigitOnly)
        let numeronFactory = GUIFactory()
        let keyboard = numeronFactory.makeKeyboard(level: level, frame: uiDesign.keyboardRect)
        self.view.addSubview(keyboard.getView())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

