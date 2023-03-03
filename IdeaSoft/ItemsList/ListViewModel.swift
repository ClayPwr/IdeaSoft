//
//  ListViewModel.swift
//  IdeaSoft
//
//  Created by User on 3/2/23.
//

import Foundation
import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func updateTable()
}

internal final class ListViewModel {
    
    typealias ImageDownload = ((UIImage?) -> ())?
    
    weak var delegate: ListViewControllerDelegate?
    private var network: NetworkProtocol!
    
    private(set) var items: [Item]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.updateTable()
            }
        }
    }
    
    init(network: NetworkProtocol) {
        self.network = network
        fetchItems()
    }
    
    public func fetchItems(_ completion: (() -> Void)? = nil) {
        Task {
            do {
                items = try await network.fetchData()
                completion?()
            } catch {
                print(error)
            }
        }
    }
    
    public func fetchImage(_ urlString: String,_ completion: ImageDownload) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                completion?(UIImage(data: data ?? Data()))
            }
        }
    }
}
