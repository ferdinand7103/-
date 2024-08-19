//
//  StoryViewModel.swift
//  HXD
//
//  Created by Rama Eka Hartono on 19/08/24.
//

import SwiftUI
import Combine

class StoryViewModel: ObservableObject {
    @Published var stories: [Story] = []
    
    init() {
        loadStories()
        print(stories)
    }
    
    private func loadStories() {
        // Locate the JSON file in the bundle
        guard let url = Bundle.main.url(forResource: "quizpage", withExtension: "json") else {
            print("File not found")
            return
        }
        
        do {
            // Load and decode the JSON data
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.stories = try decoder.decode([Story].self, from: data)
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}
