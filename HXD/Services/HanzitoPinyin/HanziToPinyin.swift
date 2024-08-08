//
//  HanziToPinyin.swift
//  HXD
//
//  Created by Ferdinand Jacques on 08/08/24.
//

import Foundation

public extension String {
    func toPinyin(withFormat outputFormat: PinyinOutputFormat = .default, separator: String = " ") -> String {
        var pinyinStrings = [String]()
        for unicodeScalar in unicodeScalars {
            let charCodePoint = unicodeScalar.value
            let pinyinArray = HanziPinyin.pinyinArray(withCharCodePoint: charCodePoint, outputFormat: outputFormat)
            
            if pinyinArray.count > 0 {
                pinyinStrings.append(pinyinArray.first! + separator)
            } else {
                pinyinStrings.append(String(unicodeScalar))
            }
        }
        
        var pinyin = pinyinStrings.joined(separator: "")
        if !pinyin.isEmpty && String(pinyin.suffix(from: pinyin.index(pinyin.endIndex, offsetBy: -1))) == separator {
            pinyin.remove(at: pinyin.index(pinyin.endIndex, offsetBy: -1))
        }
        
        return pinyin
    }
    
    func toPinyin(withFormat outputFormat: PinyinOutputFormat = .default, separator: String = " ", completion: @escaping ((_ pinyin: String) -> ())) {
        DispatchQueue.global(qos: .default).async {
            let pinyin = self.toPinyin(withFormat: outputFormat, separator: separator)
            DispatchQueue.main.async {
                completion(pinyin)
            }
        }
    }
}
