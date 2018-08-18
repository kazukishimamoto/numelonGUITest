//
//  NumeronFactory.swift
//  NumelonGUItest
//
//  Created by mat on 2018/08/14.
//  Copyright © 2018 shima. All rights reserved.
//

import Foundation
import UIKit

class GUISimpleNumeronFactory: NumeronFactory {
    func makeDisplay(level: Level, frame: CGRect) -> AbstractDisplay {
        return SimpleDisplay(frame: frame)
    }
    
    func makeKeyboard(level: Level, frame: CGRect) -> AbstractKeyboard {
        return SimpleKeyboard(frame: frame)
    }
    
    
}
