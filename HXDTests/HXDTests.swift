//
//  HXDTests.swift
//  HXDTests
//
//  Created by Ferdinand Jacques on 15/08/24.
//

import XCTest
@testable import HXD
final class HXDTests: XCTestCase {
    
    var viewModel: StoryViewModel!


    override func setUpWithError() throws {
            super.setUp()
            // Initialize the viewModel before each test
            viewModel = StoryViewModel()
            
            // Optionally add mock stories for testing purposes
        viewModel.loadStories()
        }


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testInitialStageIsOnboarding() throws {
        
            XCTAssertEqual(viewModel.currentStage, .onboarding, "Initial stage should be onboarding")
        }
        
        func testMoveToNextStageFromOnboarding() throws {
            XCTAssertEqual(viewModel.currentStory.onboarding.count, 4, "Isinya 4")
            for _ in 0..<viewModel.currentStory.onboarding.count {
                  viewModel.moveToNextStage()
              }
            XCTAssertEqual(viewModel.currentStage, .flashcard, "After onboarding, the stage should be flashcard")
        }
        
        func testMoveToNextStageFromFlashcard() throws {
            viewModel.currentStage = .flashcard
            viewModel.moveToNextStage()
            XCTAssertEqual(viewModel.currentStage, .quiz1, "After flashcard, the stage should be quiz1")
        }
        
        func testMoveToNextStageThroughAllStages() throws {
            viewModel.currentStage = .onboarding
            XCTAssertEqual(viewModel.currentStory.onboarding.count, 4, "Onboard Isinya 4")
            for _ in 0..<viewModel.currentStory.onboarding.count {
                  viewModel.moveToNextStage()
              }
            XCTAssertEqual(viewModel.currentStory.flashcard.count, 3, "Flashcard Isinya 3")
            viewModel.moveToNextStage()// Move to quiz1
            viewModel.moveToNextStage()// Move to quiz2
            viewModel.moveToNextStage()// Move to toneTest
            viewModel.moveToNextStage()// Move to conversation
            XCTAssertEqual(viewModel.currentStory.conversation.count, 3, "Convo Isinya 3")
            for _ in 0..<viewModel.currentStory.conversation.count {
                  viewModel.moveToNextStage()
              }
            // complete
            XCTAssertEqual(viewModel.currentStage, .completed, "After conversation, the stage should be completed")
        }

        
        func testEndOfAllStories() throws {
            viewModel.currentStage = .conversation
            viewModel.currentStoryIndex = viewModel.stories.count - 1
            viewModel.moveToNextStage()
            viewModel.moveToNextStage()
            viewModel.moveToNextStage()
            viewModel.moveToNextStage()
            
            XCTAssertEqual(viewModel.currentStoryIndex, viewModel.stories.count - 1, "After completing all stories, the index should not advance further")
            XCTAssertEqual(viewModel.currentStage, .completed, "After completing all stories, the stage should be completed")
        }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
