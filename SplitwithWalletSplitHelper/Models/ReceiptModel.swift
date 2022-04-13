//
//  ReceiptModel.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra.
//

import Foundation

struct Receipt: Hashable, Codable {
    var items: [RItem]?
    var discount: Double?
    var isPercentageDiscount: Bool?
    var tax: Double?
    var service: Double?
    var tip: Double?
    var isPercentageTip: Bool?
}

struct RItem: Hashable, Codable {
    var name: String
    var price: Double
    var quantity: Int
    var discount: Double?
    var isPercentageDiscount: Bool?
}
