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

enum Message: String {
    case Clear = "Clear"
    case Failed = "GameOver"
    
    static func getHintMsg(inputtedAns: [String], eat: Int, bite: Int) -> String {
        var convertedMsg = ""
        for str in inputtedAns {
            convertedMsg += str
        }
        return "\(convertedMsg) \(eat)EAT\(bite)BITE"
    }
    static func getInfoByHintMsg(msg: String) -> (inputtedAns: [String], eat: Int, bite: Int)? {
        // change format into "ans,eat,bite"
        var str = msg
        if let range = str.range(of: " ") {
            str.replaceSubrange(range, with: ",")
        }else {
            return nil
        }
        if let range = str.range(of: "EAT") {
            str.replaceSubrange(range, with: ",")
        }else {
            return nil
        }
        if let range = str.range(of: "BITE") {
            str.replaceSubrange(range, with: ",")
        }else {
            return nil
        }
        
        let convertedStr = str.components(separatedBy: ",")
        var inputtedAns = [String]()
        for s in convertedStr[0] {
            inputtedAns.append(String(s))
        }
        guard let eat = Int(convertedStr[1]) else {
            return nil
        }
        guard let bite = Int(convertedStr[2]) else {
            return nil
        }
        return (inputtedAns, eat, bite)
    }
    
    static func getClearMsg(answer: [String]) -> String {
        return Message.Clear.rawValue
    }
    static func getFailedMsg(answer: [String]) -> String {
        var appendMsg = ""
        for s in answer {
            appendMsg += s
        }
        return Message.Failed.rawValue + " Answer: " + appendMsg
    }
}





















