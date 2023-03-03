//
//  MockNetwork.swift
//  IdeaSoftTests
//
//  Created by User on 3/3/23.
//

import Foundation
@testable import IdeaSoft

final class MockNetwork: NetworkProtocol, Mockable {
    
    func fetchData<T: Codable>() async throws -> [T] {
        return loadJSON(filename: "ItemResponse", type: T.self)
    }
    
}
