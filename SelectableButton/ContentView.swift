//
//  ContentView.swift
//  SelectableButton
//
//  Created by Federico on 03/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var showAlert = false
    @State private var alertText = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Is this an important question?")
                .font(.system(size: 20))
            HStack {
                SelectButton(
                    isSelected: $isSelected,
                    color: .green,
                    text: "Yes")
                    .onTapGesture {
                        isSelected.toggle()
                        
                        if isSelected {
                            isSelected2 = false
                        }
                    }
                SelectButton(
                    isSelected: $isSelected2,
                    color: .red,
                    text: "No")
                    .onTapGesture {
                        isSelected2.toggle()
                        
                        if isSelected2 {
                            isSelected = false
                        }
                    }
            }
            Button("Submit") {
                if isSelected && !isSelected2 {
                    alertText = "Correct answer!!!"
                } else {
                   alertText = "Nope!!!"
                }
                showAlert.toggle()
                
            }.alert(alertText, isPresented: $showAlert) {
                Button("Continue") {
                    // Enter logic
                }
            }
            
        }
        .padding()
    }
    
    func selection() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
