//
//  RecordViewController.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import UIKit

class RecordViewController: UIViewController {
    private var viewModel = StoryViewModel()
    private var homeVM = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recordView = RecordView(frame: .zero, mode: .conversation, viewModel: StoryViewModel(), homeVM: HomeViewModel())
        recordView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(recordView)
        
        NSLayoutConstraint.activate([
            recordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

   
}
