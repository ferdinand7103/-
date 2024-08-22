import Foundation

class HuggingFace {
    static let instance = HuggingFace()
    // Convert audio file to Data
    func convertAudioToData(audioPath: String) -> Data? {
        let url = URL(fileURLWithPath: audioPath)
        
        do {
            let audioData = try Data(contentsOf: url)
            return audioData
        } catch {
            print("Error loading audio file: \(error)")
            return nil
        }
    }
    
    func getApiKey() -> String{
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String{
            return apiKey
        }
        return ""
    }
    
    // Fetch response from API
    func getResponse(audioPath: String) async -> String? {
        guard let audioData = convertAudioToData(audioPath: audioPath) else {
            print("Failed to convert audio to data")
            return nil
        }
        
        var request = URLRequest(url: URL(string: "https://api-inference.huggingface.co/models/jonatasgrosman/wav2vec2-large-xlsr-53-chinese-zh-cn")!, timeoutInterval: Double.infinity)
        let apiKey = getApiKey()
        request.addValue("\(apiKey)", forHTTPHeaderField: "Authorization")
//        request.addValue("", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = audioData
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return await getAnswer(data: data)
        } catch {
            print("Error during API request: \(error)")
            return nil
        }
    }
    
    // Decode JSON response
    func getAnswer(data: Data) async -> String? {
        do {
            let answer = try JSONDecoder().decode(APIResponse.self, from: data)
            return answer.text
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
