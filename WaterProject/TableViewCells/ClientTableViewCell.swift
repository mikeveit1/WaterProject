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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressStartLabel: UILabel!
    @IBOutlet weak var progressEndLabel: UILabel!
    private var labelColor: UIColor = .black
    private var progressColor: UIColor = .purple
    private var progressLabelColor: UIColor = .gray
    private let goalAmount: Double = 5000.00
    private var amountRaised: Double = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        configureClientImage()
        configureDescriptionTitleLabel()
        configureClientDescriptionLabel()
    }
    
    public func addDonation(donation: Double) {
        self.amountRaised += donation
        configureAmountRaisedLabel()
        configureProgressView()
    }
    
    private func configureClientImage() {
        clientImage.image = UIImage(named: "WaterProjectImage")
        clientImage.contentMode = .scaleAspectFit
    }
    
    private func configureDescriptionTitleLabel() {
        descriptionTitleLabel.text = "Description"
        descriptionTitleLabel.textColor = labelColor
        descriptionTitleLabel.font = UIFont(name: Fonts.boldFontName, size: Fonts.regularFontSize)
    }
    
    private func configureClientDescriptionLabel() {
        clientDescriptionLabel.text = "Every year middle class American families put off traveling because they're too busy or too tired or they just don't have enough money. And, in some ways, they're right. Traveling can be expensive. But by taking the time to learn about the discounts readily available to everyone through the internet, you can take a trip for super cheap."
        clientDescriptionLabel.textColor = .black
    }
    
    private func configureAmountRaisedLabel() {
        amountRaisedLabel.textColor = labelColor
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let formattedAmountString = numberFormatter.string(from: NSNumber(value: amountRaised))
        let amountString = "\(formattedAmountString ?? "$0.00") raised"
        let range = (amountString as NSString).range(of: formattedAmountString ?? "$0.00")
        let attributedString = NSMutableAttributedString.init(string: amountString)
        attributedString.addAttributes([NSAttributedString.Key.font: UIFont(name: Fonts.boldFontName, size: Fonts.largerFontSize)!, NSAttributedString.Key.foregroundColor: progressColor], range: range)
        amountRaisedLabel.attributedText = attributedString
    }
    
    private func configureProgressView() {
        progressView.progress = Float(amountRaised / goalAmount)
        progressView.layer.cornerRadius = 16
        progressView.clipsToBounds = true
        progressView.progressTintColor = progressColor
        progressView.trackTintColor = .white
        progressView.layer.borderColor = progressLabelColor.cgColor
        progressView.layer.borderWidth = 1.0
        configureProgressStartAndEndLabels()
    }
    
    private func configureProgressStartAndEndLabels() {
        progressStartLabel.text = "0%"
        progressEndLabel.text = "100%"
        let labels = [progressStartLabel, progressEndLabel]
        for label in labels {
            label?.textColor = progressLabelColor
        }
    }
}
