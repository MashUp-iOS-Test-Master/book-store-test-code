//
//  BookStoreTests.swift
//  BookStoreTests
//
//  Created by Eddy on 2022/06/22.
//

import XCTest
import CoreData
@testable import BookStore

class BookStoreTests: XCTestCase {
    var sut: DataManager!
    
    override func setUpWithError() throws {
        sut = DataManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_register_data_success() {
        //given
        let item = BookDTO(id: UUID(), body: "소설", category: .소설)
        
        // when
        sut.register(item)
        
        //then
        XCTAssertNotNil(sut.fetchJokes())
    }
    
    func test_delete_success() {
        // given
        let item = BookDTO(id: UUID(), body: "소설", category: .소설)
        

        // when
        sut.register(item)
//        sut.delete(joke: item)

        let result = try sut.fetchJokes()
        XCTAssertNil(result)
    }
}
