//
//  KeyboardGUI.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/14.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class KeyboardGUI: UIView, AbstructKeyboard {
    func getView() -> UIView {
        return self
    }
    
    var kernel: NumeronKernel?
    
    func tapped(point: CGPoint) {
    }
    
    // キーボードボタン
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    
    //コードから生成したときに通る初期化処理
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    //InterfaceBulderで配置した場合に通る初期化処理
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        //MyCustomView.xibファイルからViewを生成する。
        //File's OwnerはMyCustomViewなのでselfとする。
        guard let view = UINib(nibName: "KeyboardGUI", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        oneButton.setTitle("1", for: .normal)
        twoButton.setTitle("2", for: .normal)
        threeButton.setTitle("3", for: .normal)
        fourButton.setTitle("4", for: .normal)
        fiveButton.setTitle("5", for: .normal)
        sixButton.setTitle("6", for: .normal)
        sevenButton.setTitle("7", for: .normal)
        eightButton.setTitle("8", for: .normal)
        nineButton.setTitle("9", for: .normal)
        zeroButton.setTitle("0", for: .normal)
        deleteButton.setTitle("Delete", for: .normal)
        enterButton.setTitle("Enter", for: .normal)
        
        oneButton.layer.cornerRadius = 10
        twoButton.layer.cornerRadius = 10
        threeButton.layer.cornerRadius = 10
        fourButton.layer.cornerRadius = 10
        fiveButton.layer.cornerRadius = 10
        sixButton.layer.cornerRadius = 10
        sevenButton.layer.cornerRadius = 10
        eightButton.layer.cornerRadius = 10
        nineButton.layer.cornerRadius = 10
        zeroButton.layer.cornerRadius = 10
        deleteButton.layer.cornerRadius = 10
        enterButton.layer.cornerRadius = 10
        
        //ここでちゃんとあわせておかないと、配置したUIButtonがタッチイベントを拾えなかったりする。
        view.frame = self.bounds
        
        //伸縮するように
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        //addする。viewオブジェクトの2枚重ねになる。
        self.addSubview(view)
    }

}
