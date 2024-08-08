//
//  ContentView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var speechRecognizer = SpeechRecognizer()
    private let textToSpeechServices = TextToSpeechServices()
    let outputFormat = PinyinOutputFormat(toneType: .none, vCharType: .vCharacter, caseType: .lowercased)
    
    var body: some View {
        VStack {
            Button(action: {
                textToSpeechServices.speak(text: "你好，世界")
            }) {
                Text("Speak")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text(speechRecognizer.transcribedText)
                .padding()
            Text(speechRecognizer.transcribedText.toPinyin(withFormat: outputFormat, separator: " "))
                .padding()
            
            Button(action: {
                if self.speechRecognizer.isRecognizing {
                    self.speechRecognizer.stopTranscribing()
                } else {
                    self.speechRecognizer.startTranscribing()
                }
            }) {
                Text(speechRecognizer.isRecognizing ? "Stop Transcribing" : "Start Transcribing")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
