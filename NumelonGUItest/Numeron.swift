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
    public let charactors: [String]
    public let limit: Int
    init(digit: Int, charactors: [String], limit: Int) {
        self.digit = digit
        self.charactors = charactors
        self.limit = limit
    }
    init(digit: Int, charactors: [Int], limit: Int) {
        var chr = [String]()
        for c in charactors {
            chr.append(String(c))
        }
        self.init(digit: digit, charactors: chr, limit: limit)
    }
    init(digit: Int, charactors: String, limit: Int) {
        var chr = [String]()
        for c in charactors {
            chr.append(String(c))
        }
        self.init(digit: digit, charactors: chr, limit: limit)
    }
}

public struct MessageCommand {
    public let inputtedAns: [String]
    public let eat, bite: Int
    public let answer: [String]
    public let command: NumeronCommand
    public let defaultMsg: String
}

public enum NumeronCommand {
    case Hint
    case Failure
    case Clear
}

public protocol AbstractDisplay: class {
    var kernel: NumeronKernel? { get set }
    init(frame: CGRect)
    func display(command: MessageCommand)
    func getView() -> UIView
    func clear() // clear display
}

public protocol AbstractKeyboard: class {
    var kernel: NumeronKernel? { get set }
    init(frame: CGRect)
    func getView() -> UIView
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
    private struct DefaultMsg {
        static let clear = "Clear"
        static let failure = {(answer: [String]) -> String in
            var ans = ""
            for a in answer {
                ans += a
            }
            return "Game Over. ans: \(ans)"
        }
        static let hint = {(inputtedAns: [String], eat: Int, bite: Int) -> String in
            var inptAns = ""
            for a in inputtedAns {
                inptAns += a
            }
            return "\(inptAns) \(eat)EAT\(bite)BITE"
        }
    }
    private var display: AbstractDisplay
    private var keyboard: AbstractKeyboard
    public let level: Level
    private var answer = [String]()
    private var eat = 0, bite = 0
    private var turn = 1
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
            var cmdForDisplay: MessageCommand
            if eat == level.digit {
                cmdForDisplay = MessageCommand(inputtedAns: inputtedAns, eat: eat, bite: bite, answer: answer, command: .Clear, defaultMsg: DefaultMsg.clear)
                _isdone = true
            }else if turn >= level.limit {
                cmdForDisplay = MessageCommand(inputtedAns: inputtedAns, eat: eat, bite: bite, answer: answer, command: .Failure, defaultMsg: DefaultMsg.failure(answer))
                _isdone = true
            }else {
                cmdForDisplay = MessageCommand(inputtedAns: inputtedAns, eat: eat, bite: bite, answer: answer, command: .Hint, defaultMsg: DefaultMsg.hint(inputtedAns, eat, bite))
            }
            turn += 1
            display.display(command: cmdForDisplay)
        }
    }
    private var _isdone = false
    public var isDone: Bool {
        return _isdone
    }
    

    public init(level: Level, display: AbstractDisplay, keyboard: AbstractKeyboard) {
        self.level = level
        self.display = display
        self.keyboard = keyboard
        self.display.kernel = self
        self.keyboard.kernel = self
        self.initAnswer()
    }
    
    public func reset() {
        initAnswer()
        display.clear()
    }
    
    func initAnswer() {
        answer = [String]()
        let count = 1_000_000 // shuffle counts
        var charactors = level.charactors
        for _ in 0 ..< count {
            let from = Int(arc4random())%charactors.count
            let to = Int(arc4random())%charactors.count
            charactors.swapAt(from, to)
        }
        for i in 0 ..< level.digit {
            answer.append(charactors[i])
        }
    }
    
    deinit {

    }
}











































