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
        
        // キーボードボタンの配置
        let button = KeyboardButton(frame: CGRect(x: 0.0, y: 0.0, width: 100, height: 100))
        self.view.addSubview(button)
    }
    
    func getView() -> UIView {
        return view
    }
}

private class KeyboardView: UIView {

}
