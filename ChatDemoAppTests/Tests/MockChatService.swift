//
//  ChatDemoAppTests.swift
//  ChatDemoAppTests
//
//  Created by Karishma on 10/03/26.
//

import Foundation
@testable import ChatDemoApp

class MockChatService: ChatServiceProtocol {

    var replyMessage: Message = Message(text: Constants.Text.mockReply, isUser: true)

    func simulateReply(completion: @escaping (Message) -> Void) {
        completion(replyMessage)
    }
}
