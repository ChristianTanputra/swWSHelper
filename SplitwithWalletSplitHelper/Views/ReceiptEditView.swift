//
//  ReceiptEditView.swift
//  SplitwithWalletSplitHelper
//
//  Created by Christian Tanputra on 02/04/22.
//

import Foundation
import SwiftUI

struct ReceiptEditView: View {
    
    @Binding var receipt: Receipt
    
    @State var tempItems: Int = 0
    @State var tempDiscount: Double = 0
    @State var tempDiscountPercentage: Bool = false
    @State var tempTax: Double = 0
    @State var tempService: Double = 0
    @State var tempTip: Double = 0
    @State var tempTipPercentage: Bool = false
    
    // Hacky way of saving data, please don't replicate in your projects
    @State var saveData: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Items List")
                .font(.title)
                .bold()
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 3)
                VStack {
                    HStack {
                        Text("Items")
                            .bold()
                        Spacer()
                        Button(action: {
                            tempItems += 1
                        }) {
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(Color.wsOrange)
                        }
                    }
                    ForEach(0..<tempItems, id: \.self) { tempItemIndex in
                        ReceiptEditItemsListView(receipt: $receipt, saveData: $saveData, tempReceiptItemIndex: tempItemIndex)
                    }
                }
                .padding()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 3)
                VStack {
                    HStack {
                        Text("Discount:")
                            .bold()
                        TextField("Double", value: $tempDiscount, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    HStack {
                        Text("isPercentageDiscount:")
                            .bold()
                        Toggle("", isOn: $tempDiscountPercentage)
                    }
                    HStack {
                        Text("Tax:")
                            .bold()
                        TextField("Double", value: $tempTax, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    HStack {
                        Text("Service:")
                            .bold()
                        TextField("Double", value: $tempService, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    HStack {
                        Text("Tip:")
                            .bold()
                        TextField("Double", value: $tempTip, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                    HStack {
                        Text("isPercentageTip:")
                            .bold()
                        Toggle("", isOn: $tempTipPercentage)
                    }
                }
                .padding()
            }
            Button(action: {
                receipt = Receipt(items: [RItem]())
                saveData.toggle()
                
                // Allow time for items to be saved before adding the rest
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    receipt.discount = tempDiscount
                    receipt.isPercentageDiscount = tempDiscountPercentage
                    receipt.tax = tempTax
                    receipt.service = tempService
                    receipt.tip = tempTip
                    receipt.isPercentageTip = tempTipPercentage
                }
            }) {
                Text("Save current Items List details into array")
            }
            Text("JSON String: \(generateJSON(receipt: receipt))")
        }
        .padding()
    }
}

struct ReceiptEditItemsListView: View {
    
    @Binding var receipt: Receipt
    @Binding var saveData: Bool
    var tempReceiptItemIndex: Int
    
    @State var tempItemName: String = ""
    @State var tempItemPrice: Double = 0
    @State var tempItemQuantity: Int = 1
    @State var tempItemDiscount: Double = 0
    @State var tempDiscountPercentage: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 2)
            VStack {
                HStack {
                    Text("Name:")
                        .bold()
                    TextField("String", text: $tempItemName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                HStack {
                    Text("Price:")
                        .bold()
                    TextField("Double", value: $tempItemPrice, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                HStack {
                    Text("Quantity:")
                        .bold()
                    TextField("Int", value: $tempItemQuantity, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                HStack {
                    Text("Discount:")
                        .bold()
                    TextField("Double", value: $tempItemDiscount, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                HStack {
                    Text("isPercentageDiscount:")
                        .bold()
                    Toggle("", isOn: $tempDiscountPercentage)
                }
            }
            .padding()
        }
        .onChange(of: saveData) { _ in
            let newTempReceipt: RItem = RItem(name: tempItemName, price: tempItemPrice, quantity: tempItemQuantity, discount: tempItemDiscount, isPercentageDiscount: tempDiscountPercentage)
            print(newTempReceipt)
            print(receipt.items)
            receipt.items?.append(newTempReceipt)
//            receipt.items.append(newTempReceipt)
        }
    }
}
