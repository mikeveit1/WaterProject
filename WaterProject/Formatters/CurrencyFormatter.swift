//
//  CurrencyFormatter.swift
//  WaterProject
//
//  Created by Michael Veit on 10/1/21.
//

import Foundation
import UIKit


private var numberFormatter = NumberFormatter()
internal var currencyPlaceholder = "$0.00"

public func formatStringToCurrency(amount: Double) -> String {
    numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    let formattedString = numberFormatter.string(from: NSNumber(value: amount)) ?? currencyPlaceholder
    return formattedString
}

public func getDoubleFromCurrencyString(currencyString: String) -> Double {
    var amount: Double = 0
    numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    if let number = numberFormatter.number(from: currencyString) {
        amount = number.doubleValue
    }
    return amount
}

public func formatStringInputToCurrency(input: String) -> String {
    var number: NSNumber!
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currencyAccounting
    numberFormatter.currencySymbol = "$"
    numberFormatter.maximumFractionDigits = 2
    numberFormatter.minimumFractionDigits = 2
    var amountWithPrefix = input
    let expression = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
    amountWithPrefix = expression.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.count), withTemplate: "")
    let double = (amountWithPrefix as NSString).doubleValue
    number = NSNumber(value: (double / 100))
    guard number != 0 as NSNumber else {
        return ""
    }
    return numberFormatter.string(from: number)!
}
