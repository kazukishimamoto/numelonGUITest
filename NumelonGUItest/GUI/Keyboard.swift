//
//  Keyboard.swift
//  NumelonGUItest
//
//  Created by mat on 2018/08/14.
//  Copyright © 2018 shima. All rights reserved.
//

import Foundation
import UIKit

class SimpleKeyboard: AbstractKeyboard {
    weak var kernel: NumeronKernel? {
        didSet {
            if kernel == nil {
                return
            }
            kindOfButton = kernel!.level.charactors + ["Del", "↩︎"]
            numButton = kernel!.level.charactors.count + 2
            makeKeyboard()
        }
    }
    private var buttons = [UIButton]()
    private var kindOfButton = [String]()
    private var numButton = 0
    private var keySize: (width: Int, height: Int) = (3, 0)
    private var view: KeyboardView
    private var keyboard: UIView
    private var display: UILabel
    private var inputtedString = [String]()
    
    required init(frame: CGRect) {
        view = KeyboardView(frame: frame)
        display = UILabel()
        display.translatesAutoresizingMaskIntoConstraints = false
        display.backgroundColor = .white
        display.textAlignment = .right
        keyboard = UIView()
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.backgroundColor = .blue
        view.addSubview(display)
        view.addSubview(keyboard)
        
        // autolayout
        display.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        display.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        display.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        display.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0/4.0).isActive = true
        keyboard.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        keyboard.topAnchor.constraint(equalTo: display.bottomAnchor).isActive = true
        keyboard.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        keyboard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.0/4.0).isActive = true
    }

    private func makeKeyboard() {
        // generate buttons
        for i in 0 ..< kindOfButton.count {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            button.setTitle(kindOfButton[i], for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.tag = i
            button.addTarget(self, action: #selector(SimpleKeyboard.buttonAction(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            buttons.append(button)
            keyboard.addSubview(button)
        }
        
        // autolayout
        keySize = (3, Int(ceil(Double(numButton)/3.0)))
        let geti = getIndexFunc(keySize.width, keySize.height)
        // top
        for i in 0 ..< keySize.width {
            let leadingAnchor = (i == 0 ? keyboard.leadingAnchor : buttons[geti(0, i-1)].trailingAnchor)
            buttons[geti(0, i)].leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            buttons[geti(0, i)].topAnchor.constraint(equalTo: keyboard.topAnchor).isActive = true
            buttons[geti(0, i)].widthAnchor.constraint(equalTo: keyboard.widthAnchor, multiplier: 1.0/CGFloat(keySize.width)).isActive = true
            buttons[geti(0, i)].heightAnchor.constraint(equalTo: keyboard.heightAnchor, multiplier: 1.0/CGFloat(keySize.height)).isActive = true
        }
        for i in 1 ..< keySize.height - 1{
            for j in 0 ..< keySize.width {
                buttons[geti(i, j)].leadingAnchor.constraint(equalTo: buttons[geti(i-1, j)].leadingAnchor).isActive = true
                buttons[geti(i, j)].topAnchor.constraint(equalTo: buttons[geti(i-1, j)].bottomAnchor).isActive = true
                buttons[geti(i, j)].widthAnchor.constraint(equalTo: buttons[geti(i-1, j)].widthAnchor).isActive = true
                buttons[geti(i, j)].heightAnchor.constraint(equalTo: buttons[geti(i-1, j)].heightAnchor).isActive = true
            }
        }
        // bottom
        let remains = numButton - geti(keySize.height - 1, 0)
        for i in 0 ..< remains {
            let h = keySize.height - 1
            let leadingAnchor = (i == 0 ? buttons[geti(h-1, i)].leadingAnchor : buttons[geti(h, i-1)].trailingAnchor)
            buttons[geti(h, i)].leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            buttons[geti(h, i)].topAnchor.constraint(equalTo: buttons[geti(h-1, i)].bottomAnchor).isActive = true
            buttons[geti(h, i)].widthAnchor.constraint(equalTo: keyboard.widthAnchor, multiplier: 1.0/CGFloat(remains)).isActive = true
            buttons[geti(h, i)].heightAnchor.constraint(equalTo: buttons[geti(h-1, i)].heightAnchor).isActive = true
        }
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        let inputted = kindOfButton[sender.tag]
        
        if kernel!.isDone { return }
        switch inputted {
        case "Del":
            if !inputtedString.isEmpty {
                inputtedString.removeLast()
            }
        case "↩︎":
            if inputtedString.count == kernel!.level.digit {
                setAns(ans: inputtedString)
                inputtedString.removeAll()
            }
        default:
            if inputtedString.index(of: inputted) == nil && inputtedString.count < kernel!.level.digit{
                inputtedString.append(inputted)
            }
        }
        var prntMsg = ""
        for s in inputtedString {
            prntMsg += s
        }
        display.text = prntMsg
    }
    
    private func getIndexFunc(_ width: Int, _ height: Int) -> (Int, Int) -> Int {
        let w = width, _ = height
        return {$1 + $0*w}
    }
    
    func getView() -> UIView {
        assert(kernel != nil)
        return view
    }
}

private class KeyboardView: UIView {
    
}






















