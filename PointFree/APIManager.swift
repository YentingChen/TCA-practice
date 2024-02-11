import Foundation

class APIManager {
    
    func walframAlpha(query: String, callback: @escaping (WolframAlphaResult?) -> Void) {
        var components = URLComponents(string: "https://api.wolframalpha.com/v2/query")!
        components.queryItems = [
            URLQueryItem(name: "input", value: query),
            URLQueryItem(name: "format", value: "plaintext"),
            URLQueryItem(name: "output", value: "JSON"),
            URLQueryItem(name: "appid", value: "6H69Q3-828TKQJ4EP"),
        ]
        
        URLSession.shared.dataTask(with: components.url(relativeTo: nil)!) { data, response, error in
            callback(data.flatMap { try? JSONDecoder().decode(WolframAlphaResult.self, from: $0) })
        }.resume()
        
    }
    
}
