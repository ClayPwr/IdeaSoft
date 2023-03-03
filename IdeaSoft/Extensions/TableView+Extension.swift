//
//  TableView+Extension.swift
//  IdeaSoft
//
//  Created by User on 3/2/23.
//

import UIKit

extension UITableView {

    public func registerCell(_ type: UITableViewCell.Type) {
        register(type.self, forCellReuseIdentifier: type.reuseID)
    }

    public func registerNib(_ type: UITableViewCell.Type) {
        let nib = UINib(nibName: type.reuseID, bundle: nil)
        register(nib, forCellReuseIdentifier: type.reuseID)
    }

    public func registerHeaderFooterView(_ type: UITableViewHeaderFooterView.Type) {
        register(type.self, forHeaderFooterViewReuseIdentifier: type.reuseID)
    }

    public func dequeueCell<T>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
    where T: UITableViewCell {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellType.reuseID,
            for: indexPath
        ) as? T else {
            fatalError("Failed to dequeue cell with ID \(cellType.reuseID) for \(indexPath)")
        }
        return cell
    }

    public func dequeueHeaderFooterView<T>(type: T.Type = T.self) -> T
    where T: UITableViewHeaderFooterView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: type.reuseID) as? T else {
            fatalError("Failed to dequeue cell with ID \(type.reuseID)")
        }
        return view
    }

}
