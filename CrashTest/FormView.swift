//
//  FormView.swift
//  FormView
//
//  Created by Nathanael Roberton on 9/2/21.
//

import SwiftUI

struct FormView: View {
    @State private var viewSelection: Int? = 1
    @State private var income = ""
    @State private var bills = ""
    @State private var spending = ""
    @State private var savingsSelection = 2
    var savingsOptions = [5, 10, 15, 20, 0]
    
    var guidance: Double {
        let incomeAmount = Double(income) ?? 0.0
        let billAmount = Double(bills) ?? 0.0
        let spendingAmount = Double(spending) ?? 0.0
        let balance = incomeAmount - billAmount - spendingAmount
        let savingsPercent = Double(savingsOptions[savingsSelection]) * 0.01
        let budget = balance * (1.0 - savingsPercent)
        return budget / 30
    }
    
    var budgetRemains: Bool {
        let incomeAmount = Double(income) ?? 0.0
        let billAmount = Double(bills) ?? 0.0
        return incomeAmount >= billAmount
    }
    
    #if os(iOS)
    let outerPadding = 0.0
    #else
    let outerPadding = 36.0
    #endif
    let innerPadding = 24.0

    var body: some View {
        Form {
            // The following line causes a crash
            Section(header: Text("section 1").padding(.top, innerPadding)) {
            // replace the above line with the following to see the project build without crashing
            // Section(header: Text("section 1").padding(24.0)) {
                Text("$\(guidance, specifier: "%.2f")")
                    .font(.largeTitle)
                    .foregroundColor(budgetRemains ? .black : .red)
            }
            Section(header: Text("section 2")) {
                TextField("Income", text: $income)
                TextField("Bills", text: $bills)
                TextField("Spending", text: $spending)
            }
        
            Section(header: Text("section 3")) {
                Picker("Savings goal", selection: $savingsSelection) {
                    ForEach(0 ..< savingsOptions.count) { option in
                        Text("\(savingsOptions[option])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .padding(outerPadding)
        .toolbar {
            ToolbarItem {
                Button(action: {}) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
