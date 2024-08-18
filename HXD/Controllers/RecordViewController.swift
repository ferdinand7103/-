//
//  RecordViewController.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import UIKit

class RecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recordView = RecordView()
        recordView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(recordView)
        
        NSLayoutConstraint.activate([
            recordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

   
}
