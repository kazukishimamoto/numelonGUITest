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
    var displayString = ""
    
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
                button[i].append(UIButton(type: UIButtonType.system))
                button[i][j].frame = CGRect(x: Double(j) * buttonWidth, y: Double(i) * buttonHeight,
                                            width: buttonWidth, height: buttonHeight)
                var buttonText = String(((i - 1) * 3) + (j + 1))
                if buttonText == "10"{
                    buttonText = "Del"
                    // ボタンを押した時に実行するメソッドを指定
                    button[i][j].addTarget(self, action: #selector(buttonEventDelete(_:)), for: UIControlEvents.touchUpInside)
                }else if buttonText == "11"{
                    // ボタンを押した時に実行するメソッドを指定
                    button[i][j].addTarget(self, action: #selector(buttonEventNumber(_:)), for: UIControlEvents.touchUpInside)
                    buttonText = "0"
                }else if buttonText == "12"{
                    buttonText = "Ent"
                    // ボタンを押した時に実行するメソッドを指定
                    button[i][j].addTarget(self, action: #selector(buttonEventEnter(_:)), for: UIControlEvents.touchUpInside)
                }else {
                    // ボタンを押した時に実行するメソッドを指定
                    button[i][j].addTarget(self, action: #selector(buttonEventNumber(_:)), for: UIControlEvents.touchUpInside)
                }
                button[i][j].backgroundColor = UIColor.purple
                button[i][j].setTitle(buttonText, for: .normal)
                button[i][j].titleLabel?.font = UIFont.systemFont(ofSize: 25)
                
                self.view.addSubview(button[i][j])
            }
        }
    }
    @objc func buttonEventDelete(_ sender: UIButton) {
        if displayString.count == 0 {
        } else {
            displayString = String(displayString[displayString.startIndex..<displayString.index(before: displayString.endIndex)])
            display.text = displayString
        }
    }
    
    @objc func buttonEventNumber(_ sender: UIButton) {
        print("ボタンの情報: \(sender)")
        if displayString.count == 3{
            
        } else {
            displayString += sender.currentTitle!
            display.text = displayString
        }
    }
    
    @objc func buttonEventEnter(_ sender: UIButton) {
        if displayString.count == 3 {
            setAns(ans: cnvAnsType(Int(displayString)!, kernel!.level.digit))
            print("send answer: \(displayString)")
            print(sender.currentTitle!)
            displayString = ""
            display.text = displayString
        }
    }
    
    func getView() -> UIView {
        return view
    }
    
    private func cnvAnsType(_ num: Int, _ digit: Int) -> [String] {
        var n = num
        var result = [String]()
        for _ in 0 ..< digit {
            let s = String(n%10)
            result.insert(s, at: 0)
            n /= 10
        }
        return result
    }
}

private class KeyboardView: UIView {
}
