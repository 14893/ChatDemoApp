//
//  ChatDemoAppTests.swift
//  ChatDemoAppTests
//
//  Created by Karishma on 10/03/26.
//

import XCTest
@testable import ChatDemoApp

final class MessageTests: XCTestCase {

    func testMessageInitialization() {

        let message = Message(text: Constants.Replies.hello, isUser: true)

        XCTAssertEqual(message.text, Constants.Text.hello)
        XCTAssertTrue(message.isUser)
        XCTAssertNotNil(message.id)
    }

    func testMessageEquality() {

        let message1 = Message(text: Constants.Text.hi, isUser: true)
        let message2 = Message(id: message1.id, text: Constants.Text.hi, isUser: true)

        XCTAssertEqual(message1, message2)
    }
   
}
