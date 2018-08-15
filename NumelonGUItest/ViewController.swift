//
//  ViewController.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/13.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numeron: NumeronKernel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uiDesign = UIDesign(displayBounds: self.view.bounds)
        let level = Level(digit: 2, digitRange: [Int](0...4), limit: 20, type: .DigitOnly)
        let numeronFactory = GUINumeronFactory()
        let keyboard = numeronFactory.makeKeyboard(level: level, frame: uiDesign.keyboardRect)
        let display = numeronFactory.makeDisplay(level: level, frame: uiDesign.displayRect)
        numeron = NumeronKernel(level: level, display: display , keyboard: keyboard)
        self.view.addSubview(keyboard.getView())
        self.view.addSubview(display.getView())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

