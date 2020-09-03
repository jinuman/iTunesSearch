//
//  iTunesSearchAppTests.swift
//  iTunesSearchAppTests
//
//  Created by Mustafa ÖZDEMİR on 31.08.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
@testable import iTunesSearchApp

class iTunesSearchAppTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        self.viewModel = SearchViewModel(disposeBag: self.disposeBag, repository: SearchRepository())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
                        
    }
    
    func testTappedPlayPauseChangesIsPlaying() {
      
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
