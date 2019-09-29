//
//  NextSheetView.swift
//  SwiftUIControls
//
//  Created by Rex Feng on 9/29/19.
//  Copyright © 2019 xta. All rights reserved.
//

import SwiftUI

struct NextSheetView: View {
    @State var counter = 1
    @State var showingDetail = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()
            Spacer()

            Button(action: {
                self.showingDetail.toggle()
            }) {
                Text("Next sheet")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
            }.sheet(isPresented: $showingDetail) {
                NextSheetView(counter: self.counter + 1)
            }

            Spacer()

            Text("Sheet " + String(self.counter))

            if self.counter != 1 {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrowshape.turn.up.left.fill")
                            .padding()
                    }
                    Spacer()
                }
            }
        }
    }
}
