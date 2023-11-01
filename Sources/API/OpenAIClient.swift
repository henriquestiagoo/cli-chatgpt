//
//  OpenAIClient.swift
//  
//
//  Created by Tiago Henriques on 03/08/2023.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum OpenAIError: Error {
    case invalidURL
    case badRequest
    case noContent
}

public class OpenAIClient {
    
    func getAIMessage(
        content: String,
        apiKey: String?
    ) async throws -> String {
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else { throw OpenAIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let apiKey = apiKey {
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        }
        
        let chatCompletionRequest = ChatCompletionRequest(
            messages: [
                .init(
                    content: content
                )
            ]
        )
        request.httpBody = try JSONEncoder().encode(chatCompletionRequest)

        var data: Data?
        #if !os(Windows)
        (data, _) = try await URLSession.shared.data(for: request)
        #else
        (data, _) = try await URLSession.shared.asyncData(from: request)
        #endif

        guard let data = data else { throw OpenAIError.noContent }
        let chatCompletionResponse = try JSONDecoder().decode(ChatCompletionResponse.self, from: data)
        
        let choices = chatCompletionResponse.choices
        guard let messageContent = choices.first?.message.content else { throw OpenAIError.noContent }
        return messageContent
    }
}
