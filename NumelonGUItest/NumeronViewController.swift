//
//  NumeronViewController.swift
//  NumelonGUItest
//
//  Created by mat on 2018/08/18.
//  Copyright © 2018 shima. All rights reserved.
//

import UIKit

class NumeronViewController: UIViewController {
    internal var level: Level!
    private var numeron: NumeronKernel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let uiDesign = UIDesign(displayBounds: self.view.bounds) // default design
        let numeronFactory = GUINumeronFactory()
        let display = numeronFactory.makeDisplay(level: level, frame: uiDesign.displayRect)
        let keyboard = numeronFactory.makeKeyboard(level: level, frame: uiDesign.keyboardRect)
        numeron = NumeronKernel(level: level, display: display , keyboard: keyboard)
        let displayView = display.getView()
        let keyboardView = keyboard.getView()
        self.view.addSubview(displayView)
        self.view.addSubview(keyboardView)
        // init autolayout
        displayView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        displayView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20.0).isActive = true
        displayView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        displayView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2.0/3.0).isActive = true
        keyboardView.leadingAnchor.constraint(equalTo: displayView.leadingAnchor).isActive = true
        keyboardView.topAnchor.constraint(equalTo: displayView.bottomAnchor).isActive = true
        keyboardView.widthAnchor.constraint(equalTo: displayView.widthAnchor).isActive = true
        keyboardView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0/3.0).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
