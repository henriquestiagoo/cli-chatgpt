//
//  Models.swift
//  
//
//  Created by Tiago Henriques on 03/08/2023.
//

import Foundation

struct ChatCompletionResponse: Codable {
    let choices: [Choice]
    let model: String
}

struct Choice: Codable {
    let index: Int
    let message: Message
}

struct Message: Codable {
    let role: String
    let content: String
}

struct ChatCompletionRequest: Codable {
    let model: String
    let messages: [MessageRequest]
    let temperature: Double
    
    public init(
        model: String = "gpt-3.5-turbo",
        messages: [MessageRequest],
        temperature: Double = 0.7
    ) {
        self.model = model
        self.messages = messages
        self.temperature = temperature
    }
}

struct MessageRequest: Codable {
    enum Role: String, Equatable, Codable, Hashable {
        case system
        case user
        case assistant
    }
    
    let role: String
    let content: String
    
    public init(
        role: String = Role.user.rawValue,
        content: String
    ) {
        self.role = role
        self.content = content
    }
}
