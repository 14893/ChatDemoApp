//
//  ContentView.swift
//  ChatDemoApp
//
//  Created by Karishma on 10/03/26.
//


import Foundation

protocol ChatServiceProtocol {
    func simulateReply(completion: @escaping (Message) -> Void)
}

final class ChatService: ChatServiceProtocol {

    private let replies = [
        Constants.Replies.hello,
        Constants.Replies.gotIt,
        Constants.Replies.thanksForYourMessage,
        Constants.Replies.soundsGood,
        Constants.Replies.okay,
        Constants.Replies.interesting
    ]

    func simulateReply(completion: @escaping (Message) -> Void) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {

            let replyText = self.replies.randomElement() ?? Constants.Replies.okay
            completion(Message(text: replyText, isUser: false))
        }
    }
}
