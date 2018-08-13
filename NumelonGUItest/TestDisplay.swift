//
//  TestDisplay.swift
//  Numeron
//
//  Created by mat on 2018/08/13.
//  Copyright © 2018 mat. All rights reserved.
//

import UIKit

class TestDisplay: UIView, AbstructDisplay {
    var kernel: NumeronKernel?
    var currentMsg: NSString = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(msg: String) {
        print("Display: \(msg)")
        currentMsg = NSString(string: msg)
        setNeedsDisplay()
    }
    
    func getView() -> UIView {
        return self
    }
    


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.backgroundColor = .white
        currentMsg.draw(at: CGPoint(x: self.frame.minX + 100.0, y: self.frame.minY + 100.0), withAttributes: nil)
    }


}
