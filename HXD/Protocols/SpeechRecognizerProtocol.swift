//
//  SpeechRecognizerProtocol.swift
//  HXD
//
//  Created by Ferdinand Jacques on 07/08/24.
//

import Foundation

protocol SpeechRecognizerProtocol {
    var transcribedText: String { get }
    var isRecognizing: Bool { get }
    
    func startTranscribing()
    func stopTranscribing()
}
