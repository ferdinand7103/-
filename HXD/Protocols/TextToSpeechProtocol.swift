//
//  TextToSpeechProtocol.swift
//  HXD
//
//  Created by Ferdinand Jacques on 08/08/24.
//

protocol TextToSpeechProtocol {
    func speak(text: String, language: String)
    func speakSlow(text: String, language: String)
}
