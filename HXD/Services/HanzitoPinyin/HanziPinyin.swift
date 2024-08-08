//
//  HanziPinyin.swift
//  HXD
//
//  Created by Ferdinand Jacques on 08/08/24.
//

import Foundation

internal struct HanziPinyin {
    internal class WhateverClass { }
    internal static let sharedInstance = HanziPinyin()
    internal fileprivate(set) var unicodeToPinyinTable = [String: String]()
    
    init() {
        unicodeToPinyinTable = initializeResource()
    }
    
    internal static func pinyinArray(withCharCodePoint charCodePoint: UInt32, outputFormat: PinyinOutputFormat = .default) -> [String] {
        func isValidPinyin(_ pinyin: String) -> Bool {
            return pinyin != "(none0)" && pinyin.hasPrefix("(") && pinyin.hasSuffix(")")
        }
        
        let codePointHex = String(format: "%x", charCodePoint).uppercased()
        guard let pinyin = HanziPinyin.sharedInstance.unicodeToPinyinTable[codePointHex], isValidPinyin(pinyin) else {
            return []
        }
        
        let leftBracketRange = pinyin.range(of: "(")!
        let rightBracketRange = pinyin.range(of: ")")!
        let processedPinyin = String(pinyin[leftBracketRange.upperBound..<rightBracketRange.lowerBound])
        let pinyinArray = processedPinyin.components(separatedBy: ",")
        
        let formattedPinyinArray = pinyinArray.map { (pinyin) -> String in
            return PinyinFormatter.format(pinyin, withOutputFormat: outputFormat)
        }
        return formattedPinyinArray
    }
}
