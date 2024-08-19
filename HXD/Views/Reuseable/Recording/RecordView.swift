//
//  RecordView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import UIKit

enum RecordingMode {
    case pinyin
    case conversation
}

enum RecordingState {
    case idle
    case recording
    case confirming
}

class RecordView: UIView {
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to Record"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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
    
    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Confirm"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
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
        label.text = "Transcribing..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let finalTranscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Result"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    // Define dynamic constraints
    private var recordButtonTopConstraint: NSLayoutConstraint!
    
    var currentMode: RecordingMode
    private var currentState: RecordingState = .idle {
        didSet {
            updateViewForState()
        }
    }
    
    init(frame: CGRect, mode: RecordingMode) {
        self.currentMode = mode
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
    
    // Set up the view's layout and actions
    private func setupView() {
        addSubview(statusLabel)
        addSubview(recordButton)
        addSubview(transcribeLabel)
        addSubview(repeatButton)
        addSubview(confirmButton)
        addSubview(finalTranscriptionLabel)
        addSubview(instructionLabel)
        addSubview(questionLabel)
        
        setupConstraints()
        
        recordButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        repeatButton.addTarget(self, action: #selector(repeatTapped), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        // Set static constraints
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            recordButton.widthAnchor.constraint(equalToConstant: 84),
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.heightAnchor.constraint(equalTo: recordButton.widthAnchor),
            
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 40),
            confirmButton.centerYAnchor.constraint(equalTo: recordButton.centerYAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 84),
            confirmButton.heightAnchor.constraint(equalTo: confirmButton.widthAnchor),
            
            repeatButton.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -20),
            repeatButton.topAnchor.constraint(equalTo: confirmButton.topAnchor),
            repeatButton.widthAnchor.constraint(equalToConstant: 84),
            repeatButton.heightAnchor.constraint(equalTo: repeatButton.widthAnchor),
            
            transcribeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            transcribeLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
            
            finalTranscriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            finalTranscriptionLabel.topAnchor.constraint(equalTo: transcribeLabel.topAnchor)
        ])
        
        // Set dynamic top constraint for recordButton
        recordButtonTopConstraint = recordButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20)
        recordButtonTopConstraint.isActive = true
        
        if currentMode == .conversation {
            NSLayoutConstraint.activate([
                instructionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
                instructionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                       
                questionLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 10),
                questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        }
    }

    @objc private func buttonTapped() {
        if currentState == .idle {
            currentState = .recording
        } else if currentState == .recording {
            currentState = .confirming
        }
    }
    
    @objc private func repeatTapped() {
        currentState = .idle
    }
      
    @objc private func confirmTapped() {
        currentState = .confirming
    }

    private func updateViewForState() {
        switch currentState {
        case .idle:
            if currentMode == .conversation {
                instructionLabel.isHidden = false
                questionLabel.isHidden = false
                recordButtonTopConstraint.constant = 20 // Default position
            } else if currentMode == .pinyin {
                instructionLabel.isHidden = true
                questionLabel.isHidden = true
                recordButtonTopConstraint.constant = 20
            }
            statusLabel.text = "Tap to Record"
            recordButton.setImage(UIImage(named: "Microphone"), for: .normal)
            recordButton.isHidden = false
            transcribeLabel.isHidden = true
            repeatButton.isHidden = true
            confirmButton.isHidden = true
            finalTranscriptionLabel.isHidden = true

        case .recording:
            statusLabel.text = "Tap to Stop"
            recordButton.setImage(UIImage(named: "Stop"), for: .normal)
            instructionLabel.isHidden = true
            questionLabel.isHidden = true
            transcribeLabel.isHidden = false
            recordButton.isHidden = false
            repeatButton.isHidden = true
            confirmButton.isHidden = true
            finalTranscriptionLabel.isHidden = true
            
            if currentMode == .conversation {
                // Move the button up when recording in conversation mode
                recordButtonTopConstraint.constant = 5
            } else {
                recordButtonTopConstraint.constant = 20
            }

        case .confirming:
            statusLabel.text = "Tap to Confirm"
            instructionLabel.isHidden = true
            questionLabel.isHidden = true
            transcribeLabel.isHidden = true
            recordButton.isHidden = true
            repeatButton.isHidden = false
            confirmButton.isHidden = false
            finalTranscriptionLabel.isHidden = false
        }

        // Animate the constraint change
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recordButton.layer.cornerRadius = recordButton.bounds.width / 2
        recordButton.clipsToBounds = true
        confirmButton.layer.cornerRadius = recordButton.bounds.width / 2
        confirmButton.clipsToBounds = true
    }
}
