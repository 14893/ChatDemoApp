//
//  ChatDemoAppTests.swift
//  ChatDemoAppTests
//
//  Created by Karishma on 10/03/26.
//

import XCTest

@testable import ChatDemoApp

final class ChatViewModelTests: XCTestCase {

    var viewModel: ChatViewModel!
    var mockService: MockChatService!

    override func setUp() {
        super.setUp()
        mockService = MockChatService()
        viewModel = ChatViewModel(chatService: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    // Test
    func testSendMessageAddsUserMessage() {

        viewModel.sendMessage( Constants.Text.hello)

        XCTAssertEqual(viewModel.messages.count, 2)
        XCTAssertEqual(viewModel.messages.first?.text,  Constants.Text.hello)
        XCTAssertTrue(viewModel.messages.first?.isUser ?? false)
    }

    // Test 6
    func testEmptyMessageNotAdded() {

        viewModel.sendMessage("")

        XCTAssertEqual(viewModel.messages.count, 0)
    }

    // Test 7
    func testAutoReplyIsAdded() {

        viewModel.sendMessage( Constants.Text.hello)

        XCTAssertEqual(viewModel.messages.count, 2)

        let reply = viewModel.messages.last
        XCTAssertEqual(reply?.text, Constants.Text.mockReply)
        XCTAssertFalse(reply?.isUser ?? true)
    }

    // Test 8
    func testMultipleMessages() {

        viewModel.sendMessage(Constants.Text.hello)
        viewModel.sendMessage( Constants.Text.howAreYou)

        XCTAssertEqual(viewModel.messages.count, 4)
    }
}
