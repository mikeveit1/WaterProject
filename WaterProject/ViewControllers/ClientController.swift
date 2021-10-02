//
//  ViewController.swift
//  WaterProject
//
//  Created by Michael Veit on 10/1/21.
//

import UIKit
import Foundation

class ClientController: UIViewController {
    @IBOutlet weak var clientTable: UITableView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var giveNowButton: UIButton!
    private var backgroundColor: UIColor = .white
    private var donationAmount: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureClientTable()
        configureButtonView()
        configureGiveNowButton()
    }
    
    private func configureClientTable() {
        clientTable.dataSource = self
        clientTable.delegate = self
        clientTable.backgroundColor = backgroundColor
        clientTable.rowHeight = UITableView.automaticDimension
    }
    
    private func configureButtonView() {
        buttonView.backgroundColor = backgroundColor
        buttonView.layer.borderWidth = 1
        buttonView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func configureGiveNowButton() {
        giveNowButton.layer.cornerRadius = 8
        giveNowButton.setTitle("Give Now!", for: .normal)
        giveNowButton.titleLabel?.font = UIFont(name: Fonts.boldFontName, size: Fonts.largerFontSize)
        giveNowButton.setTitleColor(backgroundColor, for: .normal)
        giveNowButton.backgroundColor = .purple
    }
    
    private func enterDonationAmount() {
        var donationString: String = ""
        let enterAmountController = UIAlertController(title: "Enter Donation", message: "Please enter the amount in dollars that you would like to donate.", preferredStyle: .alert)
        enterAmountController.addTextField(configurationHandler: {(textField) -> Void in
            textField.placeholder = currencyPlaceholder
            textField.keyboardType = .numberPad
            textField.addTarget(self, action: #selector(self.textFieldChanged(_:)), for: .editingChanged)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            enterAmountController.dismiss(animated: true, completion: nil)
        }
        enterAmountController.addAction(cancelAction)
        let donateAction = UIAlertAction(title: "Donate", style: .default) { _ in
            let textField = enterAmountController.textFields![0] as UITextField
            donationString = textField.text ?? ""
            self.donationAmount = getDoubleFromCurrencyString(currencyString: donationString)
            self.clientTable.reloadData()
        }
        enterAmountController.addAction(donateAction)
        self.present(enterAmountController, animated: true, completion: nil)
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        let amountString = formatStringInputToCurrency(input: textField.text ?? currencyPlaceholder)
        textField.text = amountString
    }
    
    
    @IBAction func giveNowButtonPressed(_ sender: Any) {
        enterDonationAmount()
    }
}

extension ClientController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath) as! ClientTableViewCell
        cell.parentController = self
        cell.addDonation(donation: donationAmount)
        return cell
    }
}
