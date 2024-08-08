//
//  SpeechRecognizerProtocol.swift
//  HXD
//
//  Created by Ferdinand Jacques on 07/08/24.
//

protocol SpeechRecognizerProtocol {
    func requestAuthorization()
    func startTranscribing()
    func stopTranscribing()
    func startRecognition()
}
