//
//  ChatDemoAppTests.swift
//  ChatDemoAppTests
//
//  Created by Karishma on 10/03/26.
//

import XCTest
@testable import ChatDemoApp

final class ChatServiceTests: XCTestCase {

    func testSimulatedReply() {

        let service = ChatService()
        let expectation = XCTestExpectation(description: Constants.Text.mockReply)

        service.simulateReply { message in

            XCTAssertFalse(message.isUser)
            XCTAssertFalse(message.text.isEmpty)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 6)
    }
    
}
