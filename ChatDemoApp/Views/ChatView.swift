//
//  ContentView.swift
//  ChatDemoApp
//
//  Created by Karishma on 10/03/26.
//

import SwiftUI

struct ChatView: View {

    @StateObject private var viewModel = ChatViewModel()
    @State private var messageText: String = ""

    var body: some View {
        
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.05),
                    Color.purple.opacity(0.05),
                    Color.pink.opacity(0.05)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Text(Constants.Text.chatBotDemo)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                ScrollViewReader { proxy in

                    ScrollView {

                        VStack(spacing: 12) {

                            ForEach(viewModel.messages) { message in
                                MessageBubbleView(message: message)
                                    .id(message.id)
                            }
                        }
                        .padding(.top)
                    }
                    .onChange(of: viewModel.messages.count) {
                        if let lastMessage = viewModel.messages.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }

                Divider()

                inputBar
            }
        }
    }

     private var inputBar: some View {
        
        HStack(alignment: .bottom, spacing: 10) {

            TextField(Constants.Text.typeAMessage, text: $messageText, axis: .vertical)
                .lineLimit(1...4)
                .padding(10)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(18)
            Button {
                sendMessage()
            } label: {
                Image(systemName: Constants.Image.send)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(
                        Circle()
                            .fill(Color.blue)
                    )
            }
            .disabled(messageText.trimmingCharacters(in: .whitespaces).isEmpty)
            .opacity(messageText.trimmingCharacters(in: .whitespaces).isEmpty ? 0.5 : 1)
        }
        .padding()
    }

    private func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
