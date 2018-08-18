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
    var display = UILabel()
    var button:[[UIButton]] = [[]]
    
    required init(frame: CGRect) {
        view = KeyboardView(frame: frame)
        view.backgroundColor = .red
        
        let buttonWidth: Double = Double(self.view.frame.size.width / 3)
        let buttonHeight: Double = Double(self.view.frame.size.height / 5)
        
        let displayWidth: Double = Double(self.view.frame.size.width)
        let displayHeight: Double = Double(self.view.frame.size.height / 5)
        //var display = KeyboardDisplay(frame: CGRect(x: 0.0, y: 0.0, width: displayWidth, height: displayHeight))
        display.frame = CGRect(x: 0.0, y: 0.0, width: displayWidth, height: displayHeight)
        display.backgroundColor = .white
        self.view.addSubview(display)
        
        // キーボードボタンの配置
        for i in 1..<5 {
            button.append([])
            for j in 0..<3{
//                button[i].append(KeyButton(frame:
//                    CGRect(x: Double(j) * buttonWidth, y: Double(i) * buttonHeight,
//                           width: buttonWidth, height: buttonHeight)))
                button[i].append(UIButton(type: UIButtonType.system))
                button[i][j].frame = CGRect(x: Double(j) * buttonWidth, y: Double(i) * buttonHeight,
                                           width: buttonWidth, height: buttonHeight)
                var buttonText = String(((i - 1) * 3) + (j + 1))
                if buttonText == "10"{
                    buttonText = "Del"
                }else if buttonText == "11"{
                    buttonText = "0"
                }else if buttonText == "12"{
                    buttonText = "Ent"
                }
                button[i][j].backgroundColor = UIColor.purple
                button[i][j].setTitle(buttonText, for: .normal)
                button[i][j].titleLabel?.font = UIFont.systemFont(ofSize: 25)
                button[i][j].setTitle("Tapped!", for: .highlighted)
                // ボタンを押した時に実行するメソッドを指定
                button[i][j].addTarget(self, action: #selector(Keyboard.buttonEvent(_:)), for: UIControlEvents.touchUpInside)
                
                self.view.addSubview(button[i][j])
            }
        }
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        print("ボタンの情報: \(sender)")
        print("aaa")
    }
    
    func getView() -> UIView {
        return view
    }
}

private class KeyboardView: UIView {
}
