//
//  Helpers.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra on 02/04/22.
//

import Foundation
import SwiftUI

extension Color {
    public static var wsOrange: Color {
        return Color.init(UIColor(red: 0.98, green: 0.34, blue: 0, alpha: 1))
    }
}

// Generate a stringified JSON
func generateJSON(receipt: Receipt) -> String {
    let jsonEncoder = JSONEncoder()
    let jsonData = try! jsonEncoder.encode(receipt)
    let json = String(data: jsonData, encoding: String.Encoding.utf8)
    
    return json!
}

// Generate a fully inclusive link, perfect for web apps/sites
func generateLink(receipt: Receipt) -> String {
    var link = "walletsplit://split/"
    let json = generateJSON(receipt: receipt)
    
    link += json
    
    return link
}
