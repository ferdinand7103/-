//
//  SpeechToText.swift
//  HXD
//
//  Created by Ferdinand Jacques on 07/08/24.
//

import Speech

class SpeechRecognizer: ObservableObject {
    @Published var transcribedText = "Press start to transcribe..."
    @Published var isRecognizing = false
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    init() {
        speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))
        requestAuthorization()
    }
    
    func requestAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    print("Speech recognition authorized")
                case .denied:
                    self.showError(message: "Speech recognition authorization denied")
                case .restricted:
                    self.showError(message: "Speech recognition restricted on this device")
                case .notDetermined:
                    self.showError(message: "Speech recognition not yet authorized")
                @unknown default:
                    fatalError("Unknown speech recognition authorization status")
                }
            }
        }
        
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if granted {
                print("Microphone access granted")
            } else {
                self.showError(message: "Microphone access denied")
            }
        }
    }
    
    func startTranscribing() {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            isRecognizing = false
        } else {
            startRecognition()
            isRecognizing = true
        }
    }
    
    func stopTranscribing() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        isRecognizing = false
    }
    
    func startRecognition() {
        guard let recognizer = speechRecognizer, recognizer.isAvailable else {
            showError(message: "Speech recognizer is not available")
            return
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        let inputNode = audioEngine.inputNode
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = recognizer.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                self.transcribedText = result.bestTranscription.formattedString
                print("Recognized text: \(self.transcribedText)")
            }
            
            if let error = error {
                self.showError(message: "Recognition error: \(error.localizedDescription)")
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.isRecognizing = false
                return
            }
            
            if result?.isFinal == true {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.isRecognizing = false
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, when in
            recognitionRequest.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            showError(message: "Audio engine couldn't start: \(error.localizedDescription)")
        }
    }
    
    private func showError(message: String) {
        errorMessage = message
        showAlert = true
        print(message)
    }
}
