//
//  PollexaTests.swift
//  PollexaTests
//
//  Created by Kaan Yalçınkaya on 22.05.2024.
//
import XCTest
@testable import Pollexa

final class PollexaTests: XCTestCase {
    
    var viewController: DiscoverViewController!
    
    override func setUpWithError() throws {
        viewController = DiscoverViewController()
        viewController.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        viewController = nil
    }
    
    func testViewControllerInitialState() throws {
        XCTAssertNotNil(viewController.viewModel)
        
        XCTAssertNotNil(viewController.containerView)
        XCTAssertNotNil(viewController.activePollView)
        XCTAssertNotNil(viewController.containerStackView)
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.discoverContainerView)
        XCTAssertNotNil(viewController.discoverLabel)
    }
    
    func testViewModelFetchData() throws {
        viewController.viewModel.fetchData()
        
        XCTAssertEqual(viewController.viewModel.dataSource.posts?.count, 7)
    }
    
    func testVoteCellVoting() throws {
        let cell = VoteCell(style: .default, reuseIdentifier: "VoteCell")

        XCTAssertEqual(cell.totalVotes, 0)
        XCTAssertFalse(cell.hasVoted)
        
        cell.leftLikeButtonButton()
        
        XCTAssertTrue(cell.hasVoted)
        XCTAssertEqual(cell.totalVotes, 1)
        XCTAssertFalse(cell.leftLikeButton.isHidden)
        XCTAssertFalse(cell.rightLikeButton.isHidden)
    }
    
    func testPerformanceFetchData() throws {
        measure {
            viewController.viewModel.fetchData()
        }
    }
    
}
