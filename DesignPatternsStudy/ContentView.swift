//
//  ContentView.swift
//  DesignPatternsStudy
//
//  Created by Renoy on 20/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI View Above")
                .padding()

            // UIKit UIView
            CustomViewRepresentable()
                .frame(height: 200)
                .padding()
            Text("SwiftUI View Beloww")
                .padding()
            

            // UIKit UIViewController
            CustomViewControllerRepresentable()
                .frame(height: 400)
            
        }
    }
}

#Preview {
    ContentView()
}
