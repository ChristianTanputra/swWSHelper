//
//  LinkReceiptView.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra.
//

import Foundation
import SwiftUI

struct LinkReceiptView: View {
    @Environment(\.openURL) var openURL
    
    @Binding var receipt: Receipt
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Link Receipts")
                .font(.title)
                .bold()
            
            Text("Copies JSON into clipboard and opens up WalletSplit, prompting an immediate paste of clipboard to share Receipt data")
                .font(.caption)
            
            Button(action: {
                UIPasteboard.general.string = generateJSON(receipt: receipt)
                guard let url = URL(string: "walletsplit://split/") else { return }
                openURL(url)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.wsOrange)
                    HStack {
                        Image("WS Light Bold")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                        Text("Split with WalletSplit")
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
