//
//  TextToSpeech.swift
//  HXD
//
//  Created by Ferdinand Jacques on 08/08/24.
//

import AVFoundation

class TextToSpeechServices: TextToSpeechProtocol {
    private let speechSynthesizer = AVSpeechSynthesizer()

    func speak(text: String, language: String = "zh-CN") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        speechSynthesizer.speak(utterance)
    }
}
