//
//  ProgressBarView.swift
//  LinearProgressBar
//
//  Created by Sandeep Khade on 24/10/23.
//

import SwiftUI

struct ProgressBarView: View {
    
    @State private var progress = 0.0
    let upperBound : Double = 0.9999999999999999
    
    var body: some View {
        NavigationView{
            
            VStack {
                Text("Please tap on (+) button to change progress")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                ProgressView(value: progress,
                             label: { Text("Processing...") },
                             currentValueLabel: { Text(progress.formatted(.percent.precision(.fractionLength(0))))})
                .progressViewStyle(LinearProgressViewStyle())
                .tint(.orange)
                .foregroundColor(.gray)
                .padding()
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            if (self.progress < upperBound) {
                                self.progress += 0.1
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
