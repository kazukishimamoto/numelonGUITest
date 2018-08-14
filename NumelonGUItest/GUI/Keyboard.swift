//
//  Keyboard.swift
//  NumelonGUItest
//
//  Created by mat on 2018/08/14.
//  Copyright © 2018 shima. All rights reserved.
//

import Foundation
import UIKit

class Keyboard: AbstractKeyboard {
    private var view: KeyboardView
    var kernel: NumeronKernel?
    
    required init(frame: CGRect) {
        view = KeyboardView(frame: frame)
        view.backgroundColor = .red
    }
    
    func getView() -> UIView {
        return view
    }
}

private class KeyboardView: UIView {

}
