//
//  Display.swift
//  NumelonGUItest
//
//  Created by mat on 2018/08/14.
//  Copyright © 2018 shima. All rights reserved.
//

import Foundation
import UIKit

class SimpleDisplay: AbstractDisplay {
    weak var kernel: NumeronKernel? {
        didSet {
            if kernel == nil { return }
            panelSize.width = 2
            panelSize.height = Int(ceil(Double((kernel!.level.limit))/Double(panelSize.width)))
            // create labels
            for _ in 0 ..< panelSize.width*panelSize.height {
                let label = UILabel()
                label.backgroundColor = .white
                label.textAlignment = .center
                label.text = ""
                label.numberOfLines = 1
                label.textColor = .black
                label.layer.borderColor = UIColor.blue.cgColor
                label.layer.borderWidth = 2.0
                label.translatesAutoresizingMaskIntoConstraints = false
                panels.append(label)
                view.addSubview(label)
            }
            // init autolayout
            for i in 0 ..< panelSize.width {
                let leadingAnchor = (i == 0 ? view.leadingAnchor : panels[geti(0, i-1)].trailingAnchor)
                panels[geti(0, i)].leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                panels[geti(0, i)].topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                panels[geti(0, i)].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0/CGFloat(panelSize.width)).isActive = true
                panels[geti(0, i)].heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0/CGFloat(panelSize.height)).isActive = true
            }
            for i in 1 ..< panelSize.height {
                for j in 0 ..< panelSize.width {
                    panels[geti(i, j)].leadingAnchor.constraint(equalTo: panels[geti(0, j)].leadingAnchor).isActive = true
                    panels[geti(i, j)].topAnchor.constraint(equalTo: panels[geti(i-1, j)].bottomAnchor).isActive = true
                    panels[geti(i, j)].widthAnchor.constraint(equalTo: panels[geti(i-1, j)].widthAnchor).isActive = true
                    panels[geti(i, j)].heightAnchor.constraint(equalTo: panels[geti(i-1, j)].heightAnchor).isActive = true
                }
            }
        }
    }
    private var view: DisplayView
    private var panelSize = (width: 0, height: 0)
    private var panels = [UILabel]()
    private var turnCount = 0
    
    required init(frame: CGRect) {
        kernel = nil
        view = DisplayView(frame: frame)
        view.backgroundColor = .blue
    }
    
    func display(msg: String) {
        panels[turnCount].text = msg
        turnCount += 1
    }
    
    func display(command: MessageCommand) {
        display(msg: command.defaultMsg)
    }
    
    func clear(){
        for p in panels {
            p.text = ""
        }
        turnCount = 0
    }
    
    func getView() -> UIView {
        assert(kernel != nil)
        return view
    }
    
    private func geti(_ i: Int, _ j: Int) -> Int {
        return j + i*panelSize.width
    }
}

private class DisplayView: UIView {

}

































