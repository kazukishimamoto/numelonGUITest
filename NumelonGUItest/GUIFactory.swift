//
//  GUIFactory.swift
//  NumelonGUItest
//
//  Created by shima on 2018/08/14.
//  Copyright © 2018年 shima. All rights reserved.
//

import Foundation
import UIKit

final class GUIFactory: NumeronFactory {
    func makeDisplay(level: Level, frame: CGRect) -> AbstructDisplay {
        return TestDisplay(frame: frame)
    }
    
    func makeKeyboard(level: Level, frame: CGRect) -> AbstructKeyboard {
        return KeyboardGUI(frame: frame)
    }
    
}
