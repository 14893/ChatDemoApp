//
//  ContentView.swift
//  ChatDemoApp
//
//  Created by Karishma on 10/03/26.
//

import Foundation

struct Message: Identifiable, Equatable {
    let id: UUID
    let text: String
    let isUser: Bool
    let date: Date

    init(id: UUID = UUID(), text: String, isUser: Bool, date: Date = Date()) {
        self.id = id
        self.text = text
        self.isUser = isUser
        self.date = date
    }
}
