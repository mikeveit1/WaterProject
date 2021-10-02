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
    public var parentController: UIViewController!
    
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
        clientDescriptionLabel.text = "The water crisis is a health crisis. Nearly 1 million people die each year from water, sanitation and hygiene-related diseases which could be reduced with access to safe water or sanitation. Every 2 minutes a child dies from a water-related disease. Access to safe water and sanitation contributes to improved health and helps prevent the spread of infectious disease. It means reduced child and maternal mortality rates. It means reduced physical injury from constant lifting and carrying heavy loads of water. Now more than ever, access to safe water is critical to the health of families around the world."
        clientDescriptionLabel.textColor = .black
    }
    
    private func configureAmountRaisedLabel() {
        amountRaisedLabel.textColor = labelColor
        let formattedAmountString = formatStringToCurrency(amount: amountRaised)
        let amountString = "\(formattedAmountString) raised"
        let range = (amountString as NSString).range(of: formattedAmountString)
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
        progressView.layer.borderWidth = 1
        configureProgressStartAndEndLabels()
        if progressView.progress == 1 {
            presentSuccessMessage()
        }
    }
    
    private func presentSuccessMessage() {
        let successController = UIAlertController(title: "Success!", message: "We have reached our donation goal. Thank you!", preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "OK", style: .default) { _ in
            successController.dismiss(animated: true, completion: nil)
        }
        successController.addAction(doneAction)
        parentController.present(successController, animated: true, completion: nil)
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
