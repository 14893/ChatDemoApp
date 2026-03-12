
 ## ChatDemoApp Application Overview

 This submission implements a simple chat demo application based on the assignment requirements.
 ### Key points of the implementation:  ###

- Implemented using MVVM architecture (ChatView, ChatViewModel, ChatService)
- Users can send a message which appears on the right side of the chat
- A simulated reply is generated after a 5-second delay and displayed on the left side
- Chat messages are displayed using custom chat bubble UI with timestamps
- The message input field expands dynamically to support longer text (similar to common chat apps)
- Messages are stored using in-memory persistence as required by the assignment
- Added unit tests covering:
    - Message model
    - ChatViewModel message handling logic
    - ChatService simulated reply behavior
    
- The solution focuses on simplicity, readability, and testability, following the guidelines provided in the assignment.
