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
        
        var button:[[UIButton]] = [[]]
        
        let buttonWidth: Double = Double(self.view.frame.size.width / 3)
        let buttonHeight: Double = Double(self.view.frame.size.height / 4)
        
        // キーボードボタンの配置
        for i in 0..<4 {
            button.append([])
            for j in 0..<3{
                button[i].append(KeyboardButton(frame:
                    CGRect(x: Double(j) * buttonWidth, y: Double(i) * buttonHeight,
                           width: buttonWidth, height: buttonHeight)))
                var buttonText = String((i * 3) + (j + 1))
                if buttonText == "10"{
                    buttonText = "Del"
                }else if buttonText == "11"{
                    buttonText = "0"
                }else if buttonText == "12"{
                    buttonText = "Ent"
                }
                button[i][j].setTitle(buttonText, for: .normal)
                button[i][j].titleLabel?.font = UIFont.systemFont(ofSize: 25)
                button[i][j].setTitle("Tapped!", for: .highlighted)
                self.view.addSubview(button[i][j])
            }
        }
    }
    
    func getView() -> UIView {
        return view
    }
}

private class KeyboardView: UIView {

}
