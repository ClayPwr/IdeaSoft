//
//  ViewController.swift
//  IdeaSoft
//
//  Created by User on 3/1/23.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    private let viewModel = ListViewModel(network: Network())

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(ListCell.self)
        viewModel.delegate = self
        setupUI()
    }

    func setupUI() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshData(refreshControl: UIRefreshControl) {
        viewModel.fetchItems { [weak self] in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
            }
        }
    }
}

// MARK: - ListViewControllerDelegate
extension ListViewController: ListViewControllerDelegate {
    func updateTable() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController,
           let cell = tableView.cellForRow(at: indexPath) as? ListCell {
            vc.value = (cell.item, cell.iconImageView.image)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = viewModel.items else {
            return UITableViewCell()
        }
        let cell: ListCell = tableView.dequeueCell(for: indexPath)
        cell.update(items[indexPath.row])
        viewModel.fetchImage(items[indexPath.row].image_url) { image in
            guard let image else { return }
            cell.update(image)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items?.count ?? 0
    }
}

