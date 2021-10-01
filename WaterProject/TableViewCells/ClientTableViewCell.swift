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
    @IBOutlet weak var clientDescriptionLabel: UILabel!
    @IBOutlet weak var amountRaisedLabel: UILabel!
    private var labelColor: UIColor = .black
    public var amountRaised: Float!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        amountRaised = 1158.00
        configureClientImage()
        configureDescriptionTitleLabel()
        configureClientDescriptionLabel()
        configureAmountRaisedLabel()
    }
    
    private func configureClientImage() {
        clientImage.image = UIImage(named: "WaterProjectImage")
    }
    
    private func configureDescriptionTitleLabel() {
        descriptionTitleLabel.text = "Description"
        descriptionTitleLabel.textColor = labelColor
        descriptionTitleLabel.font = UIFont(name: "System Font Bold", size: 17.0)
    }
    
    private func configureClientDescriptionLabel() {
        clientDescriptionLabel.text = "Every year middle class American families put off traveling because they're too busy or too tired or they just don't have enough money. And, in some ways, they're right. Traveling can be expensive. But by taking the time to learn about the discounts readily available to everyone through the internet, you can take a trip for super cheap."
        clientDescriptionLabel.textColor = .black
    }
    
    private func configureAmountRaisedLabel() {
        amountRaisedLabel.textColor = labelColor
        let amountString = "$\(String(describing: amountRaised ?? 0)) raised"
        let range = (amountString as NSString).range(of: "$\(amountRaised ?? 0)")
        let attributedString = NSMutableAttributedString.init(string: amountString)
        attributedString.addAttributes([NSAttributedString.Key.font: UIFont(name: "System Font Bold", size: 24.0)!, NSAttributedString.Key.foregroundColor: UIColor.purple], range: range)
        amountRaisedLabel.attributedText = attributedString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
