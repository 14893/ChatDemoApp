//
//  ContentView.swift
//  ChatDemoApp
//
//  Created by Karishma on 10/03/26.
//

import Foundation
import Combine

final class ChatViewModel: ObservableObject {

    @Published private(set) var messages: [Message] = []

    private let chatService: ChatServiceProtocol

    init(chatService: ChatServiceProtocol = ChatService()) {
        self.chatService = chatService
    }

    func sendMessage(_ text: String) {

        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }

        let userMessage = Message(text: text, isUser: true)
        messages.append(userMessage)

        simulateReply()
    }

    private func simulateReply() {
        chatService.simulateReply { [weak self] reply in
            self?.messages.append(reply)
        }
    }
}
