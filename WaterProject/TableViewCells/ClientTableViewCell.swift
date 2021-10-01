//
//  ClientTableViewCell.swift
//  WaterProject
//
//  Created by Michael Veit on 10/1/21.
//

import UIKit

class ClientTableViewCell: UITableViewCell {
    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        configureDescriptionTitleLabel()
    }
    
    private func configureDescriptionTitleLabel() {
        descriptionTitleLabel.text = "Description"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
