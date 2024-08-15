//
//  FetchJSON.swift
//  HXD
//
//  Created by Ferdinand Jacques on 15/08/24.
//

import Foundation

class FetchJSON {
    func loadStoryData(from jsonString: String) -> StoryData? {
        let jsonData = jsonString.data(using: .utf8)!
        do {
            let storyData = try JSONDecoder().decode(StoryData.self, from: jsonData)
            return storyData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
