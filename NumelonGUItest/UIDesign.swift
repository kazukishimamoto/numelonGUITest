//
//  UIDesign.swift
//  Numeron
//
//  Created by mat on 2018/08/13.
//  Copyright © 2018 mat. All rights reserved.
//

import Foundation
import UIKit

struct UIDesign {
    let keyboardRect: CGRect
    let displayRect: CGRect
    init(displayBounds: CGRect) {
        keyboardRect = CGRect(x: 0, y: 2.0*displayBounds.height/3.0, width: displayBounds.width, height: displayBounds.height/3.0)
        displayRect = CGRect(x: 0.0, y: 0.0, width: displayBounds.width, height: 2.0*displayBounds.height/3.0)
    }
}






















