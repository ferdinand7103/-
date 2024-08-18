//
//  RecordView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import UIKit

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
    
    private let replayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Replay"), for: .normal)
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
    
    private var currentState: RecordingState = .idle {
        didSet {
            updateViewForState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // Set up the view's layout and actions
    private func setupView() {
        addSubview(statusLabel)
        addSubview(recordButton)
        addSubview(transcribeLabel)
        
        setupConstraints()
        
        recordButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: topAnchor, constant: 20),
        
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.centerYAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 60),
            recordButton.widthAnchor.constraint(equalToConstant: 84),
            recordButton.heightAnchor.constraint(equalTo: recordButton.widthAnchor),
            
            replayButton.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -20),
            replayButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            replayButton.widthAnchor.constraint(equalToConstant: 84),
            replayButton.heightAnchor.constraint(equalTo: replayButton.widthAnchor),
                        
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            confirmButton.widthAnchor.constraint(equalToConstant: 84),
            confirmButton.heightAnchor.constraint(equalTo: confirmButton.widthAnchor),
            
            transcribeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            transcribeLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20)
            
        ])
    }

    @objc private func buttonTapped() {
        if currentState == .idle {
            currentState = .recording
        } else if currentState == .recording {
            currentState = .confirming
        }
    }

    private func updateViewForState() {
        switch currentState {
        case .idle:
            statusLabel.text = "Tap to Record"
            recordButton.setImage(UIImage(named: "Microphone"), for: .normal)
            transcribeLabel.isHidden = true
            replayButton.isHidden = true
            confirmButton.isHidden = true
        case .recording:
            statusLabel.text = "Tap to Stop"
            recordButton.setImage(UIImage(named: "Stop"), for: .normal)
            transcribeLabel.isHidden = false
            replayButton.isHidden = false
            replayButton.isHidden = true
            confirmButton.isHidden = true
        case .confirming:
            statusLabel.text = "Tap to Confirm"
            transcribeLabel.isHidden = false
            recordButton.isHidden = true
            replayButton.isHidden = false
            confirmButton.isHidden = false
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recordButton.layer.cornerRadius = recordButton.bounds.width / 2
        recordButton.clipsToBounds = true
    }
}
