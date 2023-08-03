// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation

struct CLIChatGPT: AsyncParsableCommand {
    
    @Argument(help: "The contents of the message you want to send to the AI model.")
    var content: String
    
    @Option(help: "The OpenAI API Key used for authentication. Visit your API Keys page to retrieve the API Key you will use in your requests.")
    var apikey: String?
    
    // this is the code that will be executed by the command
    public func run() async throws {
        print("Fetching ...")
        
        let openAIClient = OpenAIClient()
        
        do {
            let message = try await openAIClient.getAIMessage(
                content: content,
                apiKey: apikey
            )
            
            print(message)
            
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

@main
enum CLI {
  static func main() async {
      await CLIChatGPT.main()
  }
}
