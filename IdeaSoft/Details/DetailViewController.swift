//
//  DetailViewController.swift
//  IdeaSoft
//
//  Created by User on 3/2/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var value: (item: Item?, image: UIImage?)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(value?.item, value?.image)
    }
    
    public func updateUI(_ value: Item?,_ image: UIImage?) {
        iconImageView.image = image
        idLabel.text = value?.id
        nameLabel.text = value?.name
        priceLabel.text = "\(value?.price)"
        descriptionLabel.text = value?.description
    }
}
