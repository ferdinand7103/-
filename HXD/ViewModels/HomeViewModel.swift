//
//  HomeViewModel.swift
//  HXD
//
//  Created by Rama Eka Hartono on 22/08/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var currentStage: Stage = .open
    
    
    enum Stage {
        case open
        case home
        case story
        case dictionary
        case outlineStory
    }
    
    func switchStage(to stage: Stage) {
        currentStage = stage
        print(currentStage)
    }
}
