//
//  ContentView.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra on 02/04/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var receipt: Receipt = Receipt(items: [RItem]())
    
    var body: some View {
        NavigationView {
            ScrollView {
                ReceiptEditView(receipt: $receipt)
                Divider()
                DraggableReceiptView(receipt: $receipt)
                LinkReceiptView(receipt: $receipt)
                WebLinkReceiptView(receipt: $receipt)
            }
            .navigationTitle("WSHelper")
        }
    }
}
