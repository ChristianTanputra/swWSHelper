//
//  WebLinkReceiptView.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra on 02/04/22.
//

import Foundation
import SwiftUI

struct WebLinkReceiptView: View {
    @Environment(\.openURL) var openURL
    
    @Binding var receipt: Receipt
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Web Link Receipts")
                .font(.title)
                .bold()
            
            Text("Recommended for web developers\nButton below copies the URL with everything embedded, so pasting it into Safari and running it will prompt a WalletSplit open.")
                .font(.caption)
            
            Button(action: {
                UIPasteboard.general.string = generateLink(receipt: receipt)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.blue)
                    HStack {
                        Text("Copy link to clipboard")
                            .bold()
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                .frame(height: 55)
            }
            .padding(.top)
        }
        .padding()
    }
}

