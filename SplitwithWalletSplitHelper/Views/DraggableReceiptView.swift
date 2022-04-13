//
//  DraggableReceiptView.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra.
//

import Foundation
import SwiftUI

struct DraggableReceiptView: View {
    
    @Binding var receipt: Receipt
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Draggable Receipt")
                .font(.title)
                .bold()
            
            Text("Works only when user is in group, or group view")
                .font(.caption)
            
            DraggableReceiptShareView(receipt: $receipt)
                .padding(.top)
        }
        .padding()
    }
}

struct DraggableReceiptShareView: View {
    
    @Binding var receipt: Receipt
    
    var body: some View {
        HStack {
            Text("Drag the receipt into an open group!")
            Image(systemName: "arrow.right")
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 55, height: 55, alignment: .center)
                    .foregroundColor(Color.wsOrange)
                Image("Receipt Light (Filled)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
            }
            .onDrag {
                let provider = NSItemProvider(object: generateJSON(receipt: receipt) as NSString)
                return provider
            }
        }
    }
}
