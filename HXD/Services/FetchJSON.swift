//
//  FetchJSON.swift
//  HXD
//
//  Created by Ferdinand Jacques on 15/08/24.
//

import Foundation

class FetchJSON {
    func readJSONFileFromBundle(filename: String) -> String? {
        guard let fileURL = Bundle.main.url(forResource: "QuizPage", withExtension: "json") else {
            print("File not found in bundle.")
            return nil
        }

        do {
            let jsonData = try String(contentsOf: fileURL, encoding: .utf8)
            print(jsonData, "ss")
            return jsonData
        } catch {
            print("Error reading file: \(error)")
            return nil
        }
    }
}
