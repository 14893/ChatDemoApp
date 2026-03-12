//
//  ContentView.swift
//  ChatDemoApp
//
//  Created by Karishma on 10/03/26.
//


import SwiftUI

struct MessageBubbleView: View {

    let message: Message

    var body: some View {

        HStack {

            if message.isUser {
                Spacer()
            }

            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {

                Text(message.text)
                    .padding()
                    .background(message.isUser ? Color.blue : Color.gray.opacity(0.25))
                    .foregroundColor(message.isUser ? .white : .black)
                    .cornerRadius(14)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)

                Text(DateFormatter.chatTime.string(from: message.date))
                    .font(.caption2)
                    .foregroundColor(.gray)
            }

            if !message.isUser {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
