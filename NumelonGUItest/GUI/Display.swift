//
//  Display.swift
//  NumelonGUItest
//
//  Created by mat on 2018/08/14.
//  Copyright © 2018 shima. All rights reserved.
//

import Foundation
import UIKit

class Display: AbstractDisplay {
    var kernel: NumeronKernel?
    private var view: DisplayView
    required init(frame: CGRect) {
        view = DisplayView(frame: frame)
        view.backgroundColor = .blue
    }
    
    func display(msg: String) {
        
    }
    
    func getView() -> UIView {
        return view
    }
}

private class DisplayView: UIView {
    
}
