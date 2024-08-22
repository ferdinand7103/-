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
        label.textColor = .black
        label.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Set your desired padding
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Cheebay"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
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

        // Set the image
        let arrowImage = UIImage(systemName: "arrow.clockwise")?.withRenderingMode(.alwaysTemplate)
        button.setImage(arrowImage, for: .normal)

        // Set the tint color
        button.tintColor = UIColor.orange3

        // Add a border
        button.layer.borderColor = UIColor.orange3.cgColor
        button.layer.borderWidth = 2.0  // Adjust the width as needed
        button.layer.cornerRadius = 12  // Adjust the radius for rounded corners

        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()


    
    
    private let transcribeLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
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
    
    private let meaningLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let meaningTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Meaning"
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
    
    private let rectangle: UIView = {
        let rect = UIView()
        rect.backgroundColor = .white
        rect.layer.cornerRadius = 12
        rect.layer.masksToBounds = true
        rect.isHidden = false
        rect.frame = CGRect(x: -65, y: -25, width: 430, height: 400)
        return rect
    }()
    
    private let continueButtonWrong: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        //        button.contentEdgeInsets = UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.isHidden = true
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    private let continueButtonCorrect: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = .orange3
        //        button.contentEdgeInsets = UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
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
    private var homeVM: HomeViewModel
    
    init(frame: CGRect, mode: RecordingMode, viewModel: StoryViewModel, homeVM: HomeViewModel) {
        self.currentMode = mode
        self.viewModel = viewModel
        self.homeVM = homeVM
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
        addSubview(rectangle)
        addSubview(statusLabel)
        addSubview(recordButton)
        addSubview(titleLogo)
        addSubview(repeatButton)
        addSubview(transcribeLabel)
        addSubview(instructionLabel)
        addSubview(questionLabel)
        addSubview(youSaidLabel)
        addSubview(titleLabel)
        addSubview(continueButtonWrong)
        addSubview(continueButtonCorrect)
        addSubview(statusDescriptionLabel)
        addSubview(meaningLabel)
        addSubview(meaningTitleLabel)

        setupConstraints()
        
        recordButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        repeatButton.addTarget(self, action: #selector(repeatTapped), for: .touchUpInside)
        //        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        continueButtonWrong.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        continueButtonCorrect.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        // Set static constraints
        NSLayoutConstraint.activate([
            
            rectangle.centerYAnchor.constraint(equalTo: centerYAnchor),
            rectangle.centerXAnchor.constraint(equalTo: centerXAnchor),
            rectangle.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            rectangle.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 200),
            
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            statusLabel.widthAnchor.constraint(equalToConstant: 350),
            statusLabel.heightAnchor.constraint(equalToConstant: 75),
            
            statusDescriptionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: -25),
            statusDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            recordButton.widthAnchor.constraint(equalToConstant: 84),
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.heightAnchor.constraint(equalTo: recordButton.widthAnchor),
            
            //Correct + Incorrect
            titleLogo.heightAnchor.constraint(equalToConstant: 25),
            titleLogo.widthAnchor.constraint(equalToConstant: 25),
            titleLogo.topAnchor.constraint(equalTo: topAnchor),
            titleLogo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -25),
            
            titleLabel.leadingAnchor.constraint(equalTo: titleLogo.trailingAnchor,constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            
            
            youSaidLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -25),
            youSaidLabel.topAnchor.constraint(equalTo: titleLogo.bottomAnchor,constant: 20),
            
            transcribeLabel.topAnchor.constraint(equalTo: youSaidLabel.bottomAnchor),
            transcribeLabel.leadingAnchor.constraint(equalTo: youSaidLabel.leadingAnchor),
            
            meaningTitleLabel.topAnchor.constraint(equalTo: transcribeLabel.bottomAnchor),
            meaningTitleLabel.leadingAnchor.constraint(equalTo: transcribeLabel.leadingAnchor),
            
            meaningLabel.topAnchor.constraint(equalTo: meaningTitleLabel.bottomAnchor),
            meaningLabel.leadingAnchor.constraint(equalTo: meaningTitleLabel.leadingAnchor),
            
            continueButtonCorrect.centerXAnchor.constraint(equalTo: recordButton.centerXAnchor),
            continueButtonCorrect.topAnchor.constraint(equalTo: recordButton.topAnchor,constant: 25),
            continueButtonCorrect.widthAnchor.constraint(equalToConstant: 350),
            continueButtonCorrect.heightAnchor.constraint(equalToConstant: 64),
            
            continueButtonWrong.trailingAnchor.constraint(equalTo: trailingAnchor),
            continueButtonWrong.topAnchor.constraint(equalTo: recordButton.topAnchor,constant: 25),
            continueButtonWrong.widthAnchor.constraint(equalToConstant: 250),
            continueButtonWrong.heightAnchor.constraint(equalToConstant: 50),
            
            repeatButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -30),
            repeatButton.topAnchor.constraint(equalTo: continueButtonWrong.topAnchor),
            repeatButton.widthAnchor.constraint(equalToConstant: 50),
            repeatButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        // Set dynamic top constraint for recordButton
        recordButtonTopConstraint = recordButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20)
        recordButtonTopConstraint.isActive = true

    }
    
    func compareAnswer(A: String, B: String) -> Bool {
        var diff = 0
        var cleanCharacter = B
        cleanCharacter = cleanCharacter.removingCharacters(inCharacterSet: CharacterSet.punctuationCharacters)
        cleanCharacter = cleanCharacter.removingCharacters(inCharacterSet: CharacterSet.whitespacesAndNewlines)
        print(cleanCharacter)
        // Iterate over the characters in the strings
        for i in 0..<min(A.count, cleanCharacter.count) {
            let indexA = A.index(A.startIndex, offsetBy: i)
            let indexB = cleanCharacter.index(cleanCharacter.startIndex, offsetBy: i)
            
            if A[indexA] == cleanCharacter[indexB] {
                diff += 1
            }
        }
        
        // Calculate the score
        let score = diff * 100 / B.count
        
        // Return true if the score is greater than 75, else false
        return score > 25
    }
    
    
    func checkAnswer(){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = path.appendingPathComponent("recording.wav")
        
        Task {
            print(fileName.path)
            if let response = await HuggingFace.instance.getResponse(audioPath: fileName.path) {
                print("Response: \(response)")
                if(currentMode == .pinyin){
                    if(compareAnswer(A: response,B: viewModel.currentStory.toneTest.speak)==true){
                        currentState = .correct
                        transcribeLabel.text = "Your pin yin tone sounds like native!"
                    }
                        else{
                            currentState = .wrong
                            transcribeLabel.text = "Your pinyin tones don’t seem quite accurate"
                        }
                    }
                else{
                    if(compareAnswer(A: response,B: viewModel.currentStory.user[0].hanzi)==true){
                        currentState = .correct
                        transcribeLabel.text = viewModel.currentStory.user[0].hanzi
                    }
                        else{
                            currentState = .wrong
                            transcribeLabel.text = response
                        }
                    
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
                AudioRecorder.instance.startRecording()
            }
            currentState = .recording
            
            
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
    }
    
    @objc private func continueTapped() {
        if currentMode == .conversation {
            print(viewModel.currentPage)
            if viewModel.currentPage == .home {
                homeVM.switchStage(to: .home)
            } else {
                self.viewModel.moveToNextStage()
            }
        } else {
            self.viewModel.moveToNextStage()
        }
    }
    
    private func updateViewForState() {
        switch currentState {
        case .idle:
            rectangle.backgroundColor = .white
            statusLabel.isHidden = false
            statusLabel.text = ""
            recordButton.setImage(UIImage(named: "Microphone"), for: .normal)
            recordButton.isHidden = false
            transcribeLabel.isHidden = true
            repeatButton.isHidden = true
            titleLogo.isHidden = true
            titleLabel.isHidden = true
            youSaidLabel.isHidden = true
            continueButtonWrong.isHidden = true
            continueButtonCorrect.isHidden = true
            
        case .recording:
            if (currentMode == .pinyin){
                statusLabel.text = viewModel.currentStory.toneTest.speak
            }
            else{
                statusLabel.text = viewModel.currentStory.user[0].hanzi
                statusDescriptionLabel.isHidden = false
                statusDescriptionLabel.text = viewModel.currentStory.user[0].pinyin
                
            }
            rectangle.backgroundColor = .white
            recordButton.setImage(UIImage(named: "Stop"), for: .normal)
            instructionLabel.isHidden = true
            questionLabel.isHidden = true
            continueButtonWrong.isHidden = true
            continueButtonCorrect.isHidden = true
            recordButton.isHidden = false
            repeatButton.isHidden = true
            youSaidLabel.isHidden = true
            
            
        case .correct:
            statusDescriptionLabel.isHidden = true
            rectangle.backgroundColor = .greenLight
            titleLogo.image = UIImage(systemName: "checkmark.circle.fill")
            titleLogo.tintColor = .green2
            titleLogo.isHidden = false
            statusLabel.isHidden = true
            recordButton.isHidden = true
            transcribeLabel.isHidden = false
            youSaidLabel.isHidden = false
            titleLabel.text = "Amazing!"
            titleLabel.textColor = .green2
            titleLabel.isHidden = false
            continueButtonCorrect.isHidden = false
            if (currentMode == .pinyin){
                meaningTitleLabel.isHidden = true
                meaningLabel.isHidden = true
            }
            else{
                meaningTitleLabel.isHidden = false
                meaningLabel.isHidden = false
                meaningLabel.text = viewModel.currentStory.user[0].meaning
                
            }
            
            
        case .wrong:
            statusDescriptionLabel.isHidden = true
            rectangle.backgroundColor = .redLight
            titleLogo.image = UIImage(systemName: "cross.circle.fill")
            titleLogo.tintColor = .red
            titleLogo.transform = CGAffineTransform(rotationAngle: .pi/4)
            statusLabel.isHidden = true
            recordButton.isHidden = true
            transcribeLabel.isHidden = false
            youSaidLabel.isHidden = false
            titleLogo.isHidden = false
            titleLabel.text = "Oops!"
            titleLabel.isHidden = false
            titleLabel.textColor = .red
            continueButtonWrong.isHidden = false
            repeatButton.isHidden = false
            
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

extension String {
  func removingCharacters(inCharacterSet forbiddenCharacters:CharacterSet) -> String
{
    var filteredString = self
    while true {
      if let forbiddenCharRange = filteredString.rangeOfCharacter(from: forbiddenCharacters)  {
        filteredString.removeSubrange(forbiddenCharRange)
      }
      else {
        break
      }
    }

    return filteredString
  }
}

#Preview {
    RecordingView(mode: .conversation, viewModel: StoryViewModel(), homeVM: HomeViewModel())
}
