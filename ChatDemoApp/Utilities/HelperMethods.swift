//
//  ContentView.swift
//  ChatDemoApp
//
//  Created by Karishma on 10/03/26.
//


import Foundation

extension DateFormatter {
    
    static let chatTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DateFormat.hhmm
        return formatter
    }()
}
