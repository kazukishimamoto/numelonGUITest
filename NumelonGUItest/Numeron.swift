//
//  Kernel.swift
//  Numeron
//
//  Created by mat on 2018/08/12.
//  Copyright © 2018 mat. All rights reserved.
//

import Foundation
import UIKit

public struct Level {
    public let digit: Int
    public let digitRange: [Int]
    public let limit: Int
    public let type: NumeronType
}

public enum NumeronType {
    case DigitOnly
}

public protocol AbstractDisplay: class {
    var kernel: NumeronKernel? { get set }
    init(frame: CGRect)
    func display(msg: String)
    func getView() -> UIView
    func clear() // clear display
}

public protocol AbstractKeyboard: class {
    var kernel: NumeronKernel? { get set }
    init(frame: CGRect)
    func getView() -> UIView
    // func tapped(point: CGPoint)
}

public extension AbstractKeyboard {
    public func setAns(ans: [String]) {
        kernel!.inputtedAns = [String](ans[0..<kernel!.level.digit])
    }
}

public protocol NumeronFactory: class {
    func makeDisplay(level: Level, frame: CGRect) -> AbstractDisplay
    func makeKeyboard(level: Level, frame: CGRect) -> AbstractKeyboard
}

public final class NumeronKernel {
    private weak var display: AbstractDisplay?
    private weak var keyboard: AbstractKeyboard?
    public let level: Level
    private var answer = [String]()
    private var eat = 0, bite = 0
    private var turn = 0
    private var hintMsg = ""
    internal var inputtedAns = [String]() {
        didSet {
            eat = 0
            for i in 0 ..< answer.count {
                if answer[i] == inputtedAns[i] {
                    eat += 1
                }
            }
            bite = 0
            for a in answer {
                if inputtedAns.index(of: a) != nil {
                    bite += 1
                }
            }
            hintMsg = ""
            if eat == level.digit {
                hintMsg = Message.getClearMsg(answer: answer)
                _isdone = true
            }else if turn >= level.limit {
                hintMsg = Message.getFailedMsg(answer: answer)
                _isdone = true
            }else {
                hintMsg += Message.getHintMsg(inputtedAns: inputtedAns, eat: eat, bite: bite)
            }
            turn += 1
            display?.display(msg: hintMsg)
        }
    }
    private var _isdone = false
    public var isDone: Bool {
        return _isdone
    }
    

    public init(level: Level, display: AbstractDisplay, keyboard: AbstractKeyboard) {
        // init answer
        let count = 1_000_000 // shuffle counts
        switch level.type {
        case .DigitOnly:
            // shuffle
            var range = level.digitRange
            for _ in 0 ..< count {
                let from = Int(arc4random())%range.count
                let to = Int(arc4random())%range.count
                range.swapAt(from, to)
            }
            for i in 0 ..< level.digit {
                answer.append(String(range[i]))
            }
        }

        self.level = level
        self.display = display
        self.keyboard = keyboard
        self.display!.kernel = self
        self.keyboard!.kernel = self
    }
    
    public func reset() {
        // reset answer
        let count = 1_000_000 // shuffle counts
        switch level.type {
        case .DigitOnly:
            // shuffle
            var range = level.digitRange
            for _ in 0 ..< count {
                let from = Int(arc4random())%range.count
                let to = Int(arc4random())%range.count
                range.swapAt(from, to)
            }
            for i in 0 ..< level.digit {
                answer.append(String(range[i]))
            }
        }
        display!.clear()
    }
    
    deinit {
        display?.kernel = nil // unnecessary
        keyboard?.kernel = nil // unnecessary
    }
}













































