//
//  ListViewModelTests.swift
//  IdeaSoftTests
//
//  Created by User on 3/3/23.
//

import XCTest
import Combine
@testable import IdeaSoft

final class ListViewModelTests: XCTestCase {
    
    func test_fetchItems() {
        
        let sut = makeSUT()
        
        sut.fetchItems {
            XCTAssertEqual(sut.items?.count, 3)
        }
        
    }
    
    func test_image_load() {
        let urlString = "https://picsum.photos/id/1000/600/400"
        
        let sut = makeSUT()
        
        sut.fetchImage(urlString) { image in
            XCTAssertNotNil(image)
        }
    }

    private func makeSUT() -> ListViewModel {
        ListViewModel(network: MockNetwork())
    }
}
