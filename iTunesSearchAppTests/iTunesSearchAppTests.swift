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

    func testFileManager() throws {
        
        guard let contents = MockService.readJsonFile() else {return}
        
        viewModel.behaviorRelay.accept(contents)
        
        let artistName = try viewModel.behaviorRelay.toBlocking().first()?.first?.artistName
        XCTAssertEqual(artistName, "Robert Zemeckis")
    }
    
    func testRelays() {
        
        guard let contents = MockService.readJsonFile() else {return}
        
        // create scheduler
        let rates = scheduler.createObserver([Content].self)
                
        viewModel.behaviorRelay.asDriver().drive(rates).disposed(by: disposeBag)
        
        let coldObservable = scheduler.createColdObservable([.next(10, contents.first),.next(20, contents.last)])
        
        scheduler.start()
        
        XCTAssertEqual(coldObservable.recordedEvents.first!.value.element!?.artistName, "Robert Zemeckis")
        XCTAssertEqual(coldObservable.recordedEvents.last!.value.element!?.artistName, "Sherman Alexie")
                
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
