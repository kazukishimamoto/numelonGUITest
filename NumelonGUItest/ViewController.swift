//
//  ViewController.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/13.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var level: Level!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        level = Level(digit: 2, charactors: [Int](0...4), limit: 5)
        
        let button = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        button.setTitle("button", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        // autolayout
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: (self.view.frame.width - button.frame.width)/2.0).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.view.frame.height - button.frame.height)/2.0).isActive = true
        
    }

    @objc func buttonAction(_ sender: UIButton) {
        let numeronViewController = NumeronViewController()
        numeronViewController.level = level
        self.present(numeronViewController, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

























