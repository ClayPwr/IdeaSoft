//
//  ListCell.swift
//  IdeaSoft
//
//  Created by User on 3/2/23.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    public func update(_ value: Item) {
        item = value
        idLabel.text = value.id
        nameLabel.text = value.name
        priceLabel.text = "\(value.price)"
        descriptionLabel.text = value.description
    }
    
    public func update(_ image: UIImage) {
        iconImageView.image = image
    }
    
}
