//
//  KeyboardButton.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/14.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class KeyboardButton: UIButton{
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
        guard let view = UINib(nibName: "KeyboardButton", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        //ここでちゃんとあわせておかないと、配置したUIButtonがタッチイベントを拾えなかったりする。
        view.frame = self.bounds
        
        //伸縮するように
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        //addする。viewオブジェクトの2枚重ねになる。
        self.addSubview(view)
    }
}
