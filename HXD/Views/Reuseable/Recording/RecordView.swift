//
//  RecordView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//
import SwiftUI
import UIKit
import Combine

enum RecordingMode {
    case pinyin
    case conversation
}

enum RecordingState {
    case idle
    case recording
    case confirming
    case correct
    case wrong
}

class PaddedLabel: UILabel {
    
    var padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let adjustedSize = super.sizeThatFits(size)
        return CGSize(width: adjustedSize.width + padding.left + padding.right,
                      height: adjustedSize.height + padding.top + padding.bottom)
    }
}

class RecordView: UIView {
    private let statusLabel: PaddedLabel = {
        let label = PaddedLabel()
        label.text = ""
        label.backgroundColor = .labelBackground
        label.layer.cornerRadius = 18
        label.textAlignment = .center
        label.layer.masksToBounds = true // Enable to apply the corner radius
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Set your desired padding
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Answer using this sentence in Chinese"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Question"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let recordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Microphone"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //    private let confirmButton: UIButton = {
    //        let button = UIButton(type: .system)
    //        button.setImage(UIImage(named: "Confirm"), for: .normal)
    //        button.tintColor = .white
    //        button.backgroundColor = .orange3
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.isHidden = true
    //        return button
    //    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Repeat"), for: .normal)
        button.tintColor = .orange3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    private let transcribeLabel: UILabel = {
        let label = UILabel()
        label.text = "You Said"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        
        
        return label
    }()
    
    private let youSaidLabel: UILabel = {
        let label = UILabel()
        label.text = "You Said"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Amazing"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.green2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let titleLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(systemName: "checkmark.circle.fill")
        logo.contentMode = .scaleAspectFit
        logo.tintColor = .green
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.isHidden = true
        
        return logo
    }()
    
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange3
        //        button.contentEdgeInsets = UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.isHidden = true
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    
    // Define dynamic constraints
    private var recordButtonTopConstraint: NSLayoutConstraint!
    
    var currentMode: RecordingMode
    private var currentState: RecordingState = .idle {
        didSet {
            updateViewForState()
        }
    }
    
    private var viewModel: StoryViewModel
    
    init(frame: CGRect, mode: RecordingMode, viewModel: StoryViewModel) {
        self.currentMode = mode
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMode(_ mode: RecordingMode) {
        currentMode = mode
        updateViewForState()
    }
    
    private func setupView() {
        addSubview(statusLabel)
        addSubview(recordButton)
        addSubview(titleLogo)
        addSubview(repeatButton)
        //        addSubview(confirmButton)
        addSubview(transcribeLabel)
        addSubview(instructionLabel)
        addSubview(questionLabel)
        addSubview(youSaidLabel)
        addSubview(titleLabel)
        addSubview(continueButton)
        setupConstraints()
        
        recordButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        repeatButton.addTarget(self, action: #selector(repeatTapped), for: .touchUpInside)
        //        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        // Set static constraints
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            statusLabel.widthAnchor.constraint(equalToConstant: 350),
            statusLabel.heightAnchor.constraint(equalToConstant: 75),
            
            recordButton.widthAnchor.constraint(equalToConstant: 84),
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.heightAnchor.constraint(equalTo: recordButton.widthAnchor),
            
            repeatButton.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: -75),
            repeatButton.topAnchor.constraint(equalTo: continueButton.topAnchor,constant: -15),
            repeatButton.widthAnchor.constraint(equalToConstant: 84),
            repeatButton.heightAnchor.constraint(equalTo: repeatButton.widthAnchor),
            
            //Correct + Incorrect
            titleLogo.heightAnchor.constraint(equalToConstant: 25),
            titleLogo.widthAnchor.constraint(equalToConstant: 25),
            titleLogo.topAnchor.constraint(equalTo: topAnchor),
            titleLogo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -50),
            
            titleLabel.leadingAnchor.constraint(equalTo: titleLogo.trailingAnchor,constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            
            
//            youSaidLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            youSaidLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -50),
            youSaidLabel.topAnchor.constraint(equalTo: titleLogo.bottomAnchor,constant: 20),
            
            continueButton.centerXAnchor.constraint(equalTo: recordButton.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor),
            
            continueButton.widthAnchor.constraint(equalToConstant: 300),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        // Set dynamic top constraint for recordButton
        recordButtonTopConstraint = recordButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20)
        recordButtonTopConstraint.isActive = true
        //            transcribeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        //            transcribeLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
        
        
        //            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 40),
        //            confirmButton.centerYAnchor.constraint(equalTo: recordButton.centerYAnchor),
        //            confirmButton.widthAnchor.constraint(equalToConstant: 84),
        //            confirmButton.heightAnchor.constraint(equalTo: confirmButton.widthAnchor),
        
        
        //            finalTranscriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        //            finalTranscriptionLabel.topAnchor.constraint(equalTo: transcribeLabel.topAnchor),
    }
    
    func compareAnswer(A: String, B: String) -> Bool {
        var diff = 0
        
        // Iterate over the characters in the strings
        for i in 0..<min(A.count, B.count) {
            let indexA = A.index(A.startIndex, offsetBy: i)
            let indexB = B.index(B.startIndex, offsetBy: i)
            
            if A[indexA] == B[indexB] {
                diff += 1
            }
        }
        
        // Calculate the score
        let score = diff * 100 / A.count
        
        // Return true if the score is greater than 75, else false
        return score > 75
    }
    
    
    func checkAnswer(){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = path.appendingPathComponent("recording.wav")
        
        Task {
            print(fileName.path)
            if let response = await HuggingFace.instance.getResponse(audioPath: fileName.path) {
                print("Response: \(response)")
                if(compareAnswer(A: response,B: viewModel.currentStory.toneTest.speak)==true){
                    currentState = .correct
                }
                else{
                    currentState = .wrong
                }
            } else {
                print("Failed to get a response.")
                currentState = .wrong
            }
            
        }
    }
    
    @objc private func buttonTapped() {
        if currentState == .idle {
            DispatchQueue.main.async {
                //                AudioRecorder.instance.startRecording()
            }
            currentState = .correct
            
            
        } else if currentState == .recording {
            DispatchQueue.main.async {
                AudioRecorder.instance.stopRecording()
            }
            checkAnswer()
            //            currentState = .confirming
        }
    }
    
    @objc private func repeatTapped() {
        currentState = .idle
        //        self.finalTranscriptionLabel.text = "..."
    }
    
    @objc private func continueTapped() {
        self.viewModel.moveToNextStage()
    }
    
    
    //    @objc private func confirmTapped() {
    //        currentState = .confirming
    //
    //        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    //        let fileName = path.appendingPathComponent("recording.wav")
    //
    //        Task {
    //            print(fileName.path)
    ////            print(self.viewModel.toneView)
    //            if let response = await HuggingFace.instance.getResponse(audioPath: fileName.path) {
    //                print("Response: \(response)")
    //                DispatchQueue.main.async {
    //                    self.finalTranscriptionLabel.text = response
    //                }
    //            } else {
    //                print("Failed to get a response.")
    //            }
    //        }
    //    }
    
    private func updateViewForState() {
        switch currentState {
        case .idle:
            statusLabel.text = "Tap to Record"
            recordButton.setImage(UIImage(named: "Microphone"), for: .normal)
            recordButton.isHidden = false
            //            transcribeLabel.isHidden = true
            repeatButton.isHidden = true
            //            confirmButton.isHidden = true
            //            finalTranscriptionLabel.isHidden = true
            youSaidLabel.isHidden = true
            
        case .recording:
            statusLabel.text = viewModel.currentStory.toneTest.speak
            recordButton.setImage(UIImage(named: "Stop"), for: .normal)
            instructionLabel.isHidden = true
            questionLabel.isHidden = true
            //            transcribeLabel.isHidden = false
            recordButton.isHidden = false
            repeatButton.isHidden = true
            //            confirmButton.isHidden = true
            //            finalTranscriptionLabel.isHidden = true
            youSaidLabel.isHidden = true
            
            
        case .confirming:
            statusLabel.text = "Tap to Confirm"
            instructionLabel.isHidden = true
            questionLabel.isHidden = true
            //            transcribeLabel.isHidden = true
            recordButton.isHidden = true
            repeatButton.isHidden = false
            //            confirmButton.isHidden = false
            //            finalTranscriptionLabel.isHidden = false
            youSaidLabel.isHidden = true
            
        case .correct:
            titleLogo.image = UIImage(systemName: "checkmark.circle.fill")
            titleLogo.tintColor = .green2
            titleLogo.isHidden = false
            statusLabel.isHidden = true
            recordButton.isHidden = true
            //            transcribeLabel.isHidden = true
            youSaidLabel.isHidden = false
            titleLabel.text = "Amazing !"
            titleLabel.textColor = .green2
            titleLabel.isHidden = false
//            continueButton.isHidden = false
        case .wrong:
            titleLogo.image = UIImage(systemName: "cross.circle.fill")
            titleLogo.tintColor = .red
            titleLogo.transform = CGAffineTransform(rotationAngle: .pi/4)
            statusLabel.isHidden = true
            recordButton.isHidden = true
//            transcribeLabel.isHidden = false
            youSaidLabel.isHidden = false
            titleLogo.isHidden = false
            titleLabel.text = "Oops !"
            titleLabel.isHidden = false
            titleLabel.textColor = .red
            //            continueButton.isHidden = false
            //            repeatButton.isHidden = false
        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recordButton.layer.cornerRadius = recordButton.bounds.width / 2
        recordButton.clipsToBounds = true
        //        confirmButton.layer.cornerRadius = recordButton.bounds.width / 2
        //        confirmButton.clipsToBounds = true
    }
    
    
}

#Preview {
    RecordingView(mode: .conversation, viewModel: StoryViewModel())
}
